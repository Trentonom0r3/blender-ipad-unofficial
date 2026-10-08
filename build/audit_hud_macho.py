"""Bounded compiled ARM64 HUD launch audit. No binary/source mutation.

Usage: python audit_hud_macho.py <Blender> --output-dir <isolated-output>
Exit: 0 verified bounded obligations; 1 negative; 2 inconclusive.
The CFG overapproximates branches. Unsupported inlining/spills/indirect transfers
are inconclusive, never proof. This is not an emulator or device acceptance.
"""
from __future__ import annotations
import argparse, collections, hashlib, json, re, struct, subprocess, sys, uuid
from pathlib import Path

LLVM = Path(r'C:/Program Files/LLVM/bin')
GET_AREA = '__Z11CTX_wm_areaPK8bContext'
GET_REGION = '__Z13CTX_wm_regionPK8bContext'
SET_AREA = '__Z15CTX_wm_area_setP8bContextP7ScrArea'
SET_REGION = '__Z17CTX_wm_region_setP8bContextP7ARegion'
SIZE = '__Z27ED_area_update_region_sizesP15wmWindowManagerP8wmWindowP7ScrArea'
FLOAT = '__Z23ED_region_floating_initP7ARegion'
CREATE = '__Z19BKE_area_region_newv'
ALLOCATION_SLOTS = {}


def command(tool, *args):
    return subprocess.run([str(LLVM / (tool + '.exe')), *map(str,args)],
                          capture_output=True, text=True, encoding='utf-8',
                          errors='replace', check=True).stdout


def macho_uuid(path):
    with path.open('rb') as f:
        magic,cpu,subcpu,typ,ncmds,size,flags,reserved = struct.unpack('<8I',f.read(32))
        if magic != 0xfeedfacf or cpu != 0x100000c:
            raise ValueError('Expected a thin little-endian ARM64 Mach-O')
        data = f.read(size)
    off=0
    for _ in range(ncmds):
        cmd,length=struct.unpack_from('<II',data,off)
        if length<8 or off+length>len(data): raise ValueError('Invalid load command')
        if cmd==0x1b: return str(uuid.UUID(bytes=data[off+8:off+24])).upper()
        off+=length
    raise ValueError('Mach-O has no LC_UUID')


def symbols(path):
    out=command('llvm-nm','--defined-only','--numeric-sort',path)
    found=[]
    for line in out.splitlines():
        slot=re.match(r'^([0-9a-fA-F]{16})\s+[DdSs]\s+(.+)$',line)
        if slot and ('calloc' in slot[2] or 'malloc' in slot[2]) and (slot[2].startswith('_MEM_') or slot[2].startswith('__ZN11mem_guarded8internal')):
            ALLOCATION_SLOTS[int(slot[1],16)]=slot[2]
        m=re.match(r'^([0-9a-fA-F]{16})\s+([Tt])\s+(.+)$',line)
        if m:found.append((int(m[1],16),m[3]))
    if not found:raise ValueError('No defined text symbols; stripped/inlined proof unavailable')
    return found


def select(syms, fragment):
    found=[(addr,name) for addr,name in syms if fragment in name]
    if len(found)!=1:raise ValueError(f'Expected one symbol containing {fragment}, got {len(found)}')
    addr,name=found[0]
    following=[a for a,n in syms if a>addr]
    if not following:raise ValueError('Cannot bound last text symbol')
    return addr,min(following),name


def disassemble(path,syms,fragment,output):
    start,end,name=select(syms,fragment)
    raw=command('llvm-objdump','--disassemble','--no-show-raw-insn',
                f'--start-address={start:#x}',f'--stop-address={end:#x}',path)
    output.write_text(raw,encoding='utf-8')
    ins={}
    for line in raw.splitlines():
        m=re.match(r'^\s*([0-9a-fA-F]+):\s+([^\s]+)\s*(.*)$',line)
        if m and start<=int(m[1],16)<end:
            ins[int(m[1],16)]=(m[2],m[3].split(';')[0].strip())
    if not ins or min(ins)!=start:raise ValueError('Incomplete symbol disassembly')
    return {'start':start,'end':end,'symbol':name,'ins':ins}


def target(arg):
    matches=re.findall(r'(?<![#\w])0x([0-9a-fA-F]+)',arg.split('<',1)[0])
    return int(matches[-1],16) if matches else None


def callee(arg):
    m=re.search(r'<([^>]+)>',arg)
    return m[1] if m else None


def reg(text):
    m=re.fullmatch(r'[xw](\d+)',text.strip())
    return int(m[1]) if m and int(m[1])<31 else None


def successors(fn,pc,mn,arg):
    ins=fn['ins']; nxt=pc+4
    if mn in ('ret','retab','retaa'):return [],True,False
    if mn in ('br','braa','brab'):return [],False,True
    if mn=='b':
        dest=target(arg)
        return ([dest] if dest in ins else []),dest not in ins,False
    if mn.startswith('b.') or mn in ('cbz','cbnz','tbz','tbnz'):
        dest=target(arg)
        if dest not in ins:return [],False,True
        return list(dict.fromkeys([dest,nxt])),False,False
    if nxt not in ins:return [],False,True
    return [nxt],False,False


def classify(status,issues,unknown):
    if issues:return 'failed'
    if unknown:return 'inconclusive'
    return status


def owner_audit(fn):
    # Tags: C=context, A=current function's area, SA/SR=original getter values.
    regs=['?']*31;regs[0]='C';regs[2]='A'
    initial=(tuple(regs),False,False,False)
    queue=collections.deque([(fn['start'],initial)]);seen=set();issues=set();unknown=set()
    restored=set();mutation=set();post_returns=set();calls=[]
    while queue:
        pc,state=queue.popleft()
        if (pc,state) in seen:continue
        seen.add((pc,state))
        if len(seen)>100000:
            unknown.add('CFG/data-flow exceeded bounded state limit');break
        regs,dirty,area_ok,region_ok=state;regs=list(regs)
        mn,arg=fn['ins'][pc]
        parts=[s.strip() for s in arg.split(',')]
        if mn in ('bl','blr','blraa','blrab'):
            name=callee(arg) if mn=='bl' else None
            if mn!='bl':unknown.add(f'Indirect call at {pc:#x}')
            if name in (GET_AREA,GET_REGION,SET_AREA,SET_REGION):
                if regs[0]!='C':unknown.add(f'Unproved setter/getter context at {pc:#x}')
            if name==SET_AREA:
                calls.append({'address':hex(pc),'callee':name,'arg':regs[1]})
                if regs[1]=='SA':
                    if not dirty:unknown.add(f'Restore before proven mutation at {pc:#x}')
                    area_ok=True;region_ok=False
                elif regs[1]=='A':
                    mutation.add(pc);dirty=True;area_ok=False;region_ok=False
                else:unknown.add(f'Unproved area argument at {pc:#x}')
            if name==SET_REGION:
                calls.append({'address':hex(pc),'callee':name,'arg':regs[1]})
                if regs[1]=='SR':
                    restored.add(pc)
                    if not area_ok:issues.add(f'Saved region restored before saved area at {pc:#x}')
                    region_ok=True
            for i in range(19):regs[i]='?'
            if name==GET_AREA:regs[0]='SA'
            if name==GET_REGION:regs[0]='SR'
        elif mn=='mov' and len(parts)==2:
            dst=reg(parts[0]);src=reg(parts[1])
            if dst is not None:regs[dst]=regs[src] if src is not None and parts[0].startswith('x') else '?'
        elif mn not in ('str','stur','stp','stnp','strb','strh','cmp','cmn','tst',
                         'ret','retab','retaa','b','cbz','cbnz','tbz','tbnz','nop') and not mn.startswith('b.'):
            # Do not retain pointer tags across arithmetic, loads, or conditional moves.
            dst=reg(parts[0]) if parts else None
            if dst is not None:regs[dst]='?'
            if mn in ('ldp','ldnp') and len(parts)>1:
                dst=reg(parts[1])
                if dst is not None:regs[dst]='?'
        dests,terminal,unsupported=successors(fn,pc,mn,arg)
        if unsupported:unknown.add(f'Unsupported control transfer at {pc:#x}')
        if terminal and dirty:
            post_returns.add(pc)
            if not (area_ok and region_ok):issues.add(f'Post-mutation exit has incomplete ordered restoration at {pc:#x}')
        new=(tuple(regs),dirty,area_ok,region_ok)
        queue.extend((d,new) for d in dests)
    if not mutation or not restored or not post_returns:
        unknown.add('Missing explicit mutation/getter/restoration/return evidence (possibly inlined)')
    return {'status':classify('passed',issues,unknown),'issues':sorted(issues),
            'limitations':sorted(unknown),'instruction_states':len(seen),
            'mutation_calls':list(map(hex,sorted(mutation))),
            'restoration_calls':list(map(hex,sorted(restored))),
            'post_mutation_return_sites':list(map(hex,sorted(post_returns))),
            'setter_calls':sorted({(v['address'],v['callee'],v['arg']) for v in calls})}


def allocator_at(fn,pc):
    """Resolve only a direct ADRP/ADD/LDR of a named native allocation slot.
    Never infer arbitrary BLR metadata or accept it as a sizing/context call.
    """
    values={}
    for pos in range(max(fn['start'],pc-80),pc):
        if pos not in fn['ins']:continue
        mn,arg=fn['ins'][pos];parts=[v.strip() for v in arg.split(',')]
        dst=reg(parts[0]) if parts else None
        if mn=='adrp' and dst is not None:
            values[dst]=target(arg)
        elif mn=='add' and len(parts)==3 and dst is not None:
            src=reg(parts[1]);base=values.get(src)
            try:offset=int(parts[2].removeprefix('#'),0)
            except ValueError:offset=None
            values[dst]=base+offset if isinstance(base,int) and offset is not None else None
        elif mn=='ldr' and dst is not None:
            match=re.search(r'\[(x\d+)(?:,\s*#(0x[0-9a-f]+|\d+))?\]',arg)
            base=values.get(reg(match[1])) if match else None
            off=int(match[2],0) if match and match[2] else 0
            values[dst]=('slot',base+off) if isinstance(base,int) else None
        elif mn in ('bl','blr','blraa','blrab'):
            for idx in range(19):values.pop(idx,None)
        elif mn not in ('str','stur','stp','stnp','strb','strh','cmp','cmn','tst',
                         'b','cbz','cbnz','tbz','tbnz','nop') and not mn.startswith('b.'):
            if dst is not None:values.pop(dst,None)
    token=values.get(reg(fn['ins'][pc][1]))
    return ALLOCATION_SLOTS.get(token[1]) if isinstance(token,tuple) and token[0]=='slot' else None


def acyclic_flow(fn):
    """Require a DAG, not increasing addresses: optimizers reorder shared tails.
    Per-PC symbolic tokens may be reused safely only when an instruction cannot
    execute twice on one invocation's path. Unknown branch conditions are kept.
    """
    graph={};pending=[fn['start']];reachable=set()
    while pending:
        pc=pending.pop()
        if pc in reachable:continue
        reachable.add(pc)
        mn,arg=fn['ins'][pc]
        dests,terminal,unsupported=successors(fn,pc,mn,arg)
        graph[pc]=tuple(d for d in dests if d in fn['ins'])
        pending.extend(graph[pc])
    indegree={pc:0 for pc in reachable}
    for pc,dests in graph.items():
        for dest in dests:indegree[dest]+=1
    ready=collections.deque(pc for pc,count in indegree.items() if count==0)
    processed=0
    while ready:
        pc=ready.popleft();processed+=1
        for dest in graph[pc]:
            indegree[dest]-=1
            if indegree[dest]==0:ready.append(dest)
    return {'acyclic':processed==len(reachable),'reachable_instructions':len(reachable),
            'backward_address_edges':sorted((hex(pc),hex(d)) for pc,ds in graph.items() for d in ds if d<=pc),
            'cycle_remaining_instructions':sorted(hex(pc) for pc,n in indegree.items() if n)}


def refresh_audit(fn):
    # Native AArch64 ABI preserves x19..x28 across calls. MOV aliases share a
    # token. A CBZ/CBNZ on an x register refines ALL still-live copies of that
    # exact token; no memory/pointee, native allocator, or branch-feasibility
    # assumption is needed. Unknown w-register tests stay overapproximated.
    flow=acyclic_flow(fn)
    if not flow['acyclic']:
        return {'status':'inconclusive','issues':[],
                'limitations':['Directed cycle: per-PC alias provenance cannot model repeated fresh values.'],
                'flow_proof':flow}
    initial=tuple(f'U:entry:{i}' for i in range(31))
    queue=collections.deque([(fn['start'],False,False,initial)])
    seen=set();issues=set();unknown=set();sizes=set();floats=set();creates=set();created_returns=set();allocators={};refinements=set()
    while queue:
        pc,sized,created,registers=queue.popleft()
        state=(pc,sized,created,registers)
        if state in seen:continue
        seen.add(state)
        if len(seen)>100000:
            unknown.add('CFG/alias data-flow exceeded bounded state limit');break
        mn,arg=fn['ins'][pc];name=callee(arg) if mn in ('bl','b') else None
        regs=list(registers);parts=[v.strip() for v in arg.split(',')]
        if name==CREATE:created=True;creates.add(pc)
        if name==SIZE:sized=True;sizes.add(pc)
        if name==FLOAT:
            floats.add(pc)
            if not sized:issues.add(f'Floating init reachable without prior native sizing at {pc:#x}')
        if mn in ('bl','blr','blraa','blrab'):
            if mn!='bl':
                allocation=allocator_at(fn,pc)
                if allocation:allocators[hex(pc)]=allocation
                else:unknown.add(f'Unresolved indirect call in refresh at {pc:#x}')
            for i in range(19):regs[i]=f'U:call:{pc:x}:{i}'
        elif mn=='mov' and len(parts)==2:
            dst=reg(parts[0]);src=reg(parts[1])
            if dst is not None:
                try:literal=int(parts[1].removeprefix('#'),0) if parts[1].startswith('#') else None
                except ValueError:literal=None
                if literal is not None:regs[dst]='ZERO' if literal==0 else 'NONZERO'
                elif src is not None and parts[0].startswith('x') and parts[1].startswith('x'):
                    regs[dst]=regs[src]
                elif src is not None and regs[src] in ('ZERO','NONZERO'):
                    regs[dst]=regs[src] if regs[src]=='ZERO' else f'U:truncated:{pc:x}'
                else:regs[dst]=f'U:write:{pc:x}:{dst}'
        elif mn not in ('str','stur','stp','stnp','strb','strh','cmp','cmn','tst',
                         'ret','retab','retaa','b','cbz','cbnz','tbz','tbnz','nop') and not mn.startswith('b.'):
            dst=reg(parts[0]) if parts else None
            if dst is not None:regs[dst]=f'U:write:{pc:x}:{dst}'
            if mn in ('ldp','ldnp') and len(parts)>1:
                dst=reg(parts[1])
                if dst is not None:regs[dst]=f'U:write:{pc:x}:{dst}'
        dests,terminal,unsupported=successors(fn,pc,mn,arg)
        if unsupported:unknown.add(f'Unsupported control transfer at {pc:#x}')
        if terminal and created:
            created_returns.add(pc)
            if not sized:issues.add(f'Newly allocated HUD can return before native sizing at {pc:#x}')
        if mn in ('cbz','cbnz') and parts and parts[0].startswith('x'):
            tested=reg(parts[0]);value=regs[tested];branch=target(arg)
            for dest in dests:
                zero=(dest==branch) == (mn=='cbz')
                required='ZERO' if zero else 'NONZERO'
                if value in ('ZERO','NONZERO') and value!=required:continue
                refined=tuple(required if v==value else v for v in regs)
                aliases=tuple(f'x{i}' for i,v in enumerate(regs) if v==value)
                refinements.add((hex(pc),parts[0],required,aliases))
                queue.append((dest,sized,created,refined))
        else:queue.extend((d,sized,created,tuple(regs)) for d in dests)
    if not creates or not floats or not sizes or not created_returns:
        unknown.add('Missing explicit allocation/sizing/floating/return calls (possibly inlined)')
    return {'status':classify('passed',issues,unknown),'issues':sorted(issues),
            'limitations':sorted(unknown),'instruction_states':len(seen),
            'native_size_calls':list(map(hex,sorted(sizes))),
            'floating_init_calls':list(map(hex,sorted(floats))),
            'allocation_calls':list(map(hex,sorted(creates))),
            'created_return_sites':list(map(hex,sorted(created_returns))),
            'verified_native_allocator_calls':allocators,
            'zero_alias_refinements':sorted(refinements),'flow_proof':flow}


def direct_profile(fn,required,indirect_required=False):
    calls=[(pc,callee(arg)) for pc,(mn,arg) in fn['ins'].items() if mn in ('bl','b')]
    missing=[fragment for fragment in required if not any(name and fragment in name for pc,name in calls)]
    indirect=[hex(pc) for pc,(mn,arg) in fn['ins'].items() if mn in ('blr','blraa','blrab')]
    if indirect_required and not indirect:missing.append('native runtime init indirect call')
    return {'status':'inconclusive' if missing else 'passed','missing':missing,
            'required_direct_fragments':required,'indirect_call_sites':indirect}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('binary',type=Path);parser.add_argument('--output-dir',type=Path,required=True)
    args=parser.parse_args();args.output_dir.mkdir(parents=True,exist_ok=True)
    report={'binary':str(args.binary.resolve()),'audit':'bounded ARM64 compiled HUD launch obligations',
            'device_acceptance':False,'limits':['Branch conditions overapproximated; false negatives require manual review.',
            'Registers spilled/reloaded or setter/helper inlining produce inconclusive, never relaxed checks.',
            'Refresh alias proof requires an acyclic CFG; backward-address shared tails are allowed, directed cycles are refused.',
            'Native runtime type-to-init connection and live first-frame state remain source/device obligations.']}
    try:
        report['uuid']=macho_uuid(args.binary)
        digest=hashlib.sha256()
        with args.binary.open('rb') as f:
            for block in iter(lambda:f.read(1024*1024),b''):digest.update(block)
        report['sha256']=digest.hexdigest();syms=symbols(args.binary)
        fragments={'owner':'ipad_hud_owner_capture','refresh':'UI_ipad_corner_hud_refresh',
                   'sizes':'ED_area_update_region_sizes','hud_init':'hud_region_init',
                   'panels_init':'ED_region_panels_init'}
        funcs={k:disassemble(args.binary,syms,v,args.output_dir/(k+'.asm')) for k,v in fragments.items()}
        report['symbols']={k:{n:v for n,v in fn.items() if n!='ins'} for k,fn in funcs.items()}
        report['owner_restoration']=owner_audit(funcs['owner'])
        report['refresh_initialization']=refresh_audit(funcs['refresh'])
        report['native_sizing_profile']=direct_profile(funcs['sizes'],[],True)
        report['native_hud_init_profile']=direct_profile(funcs['hud_init'],['ED_region_panels_init','UI_region_handlers_add'])
        report['native_view2d_init_profile']=direct_profile(funcs['panels_init'],['UI_view2d_region_reinit'])
        statuses=[v['status'] for v in report.values() if isinstance(v,dict) and 'status'in v]
        report['status']='failed' if 'failed' in statuses else 'inconclusive' if 'inconclusive' in statuses else 'passed'
    except (ValueError,OSError,subprocess.CalledProcessError) as error:
        report['status']='inconclusive';report['error']=str(error)
    (args.output_dir/'audit.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'status':report['status'],'uuid':report.get('uuid'),
                      'report':str(args.output_dir/'audit.json'),
                      'owner':report.get('owner_restoration',{}).get('status'),
                      'refresh':report.get('refresh_initialization',{}).get('status')},indent=2))
    return {'passed':0,'failed':1,'inconclusive':2}[report['status']]

if __name__=='__main__':sys.exit(main())
