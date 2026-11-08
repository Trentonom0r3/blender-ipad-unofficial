import pathlib,struct,hashlib,json,re,subprocess,uuid
D=pathlib.Path(__file__).resolve().parent
B=D/'Blender'; blob=B.read_bytes()
OB='C:/Program Files/LLVM/bin/llvm-objdump.exe'
OLD=D.parents[2]/'pencil-node-input-audit/binary-40728695044/Blender'
o=32; sections=[]; uid=None
for _ in range(struct.unpack_from('<I',blob,16)[0]):
 c,n=struct.unpack_from('<II',blob,o)
 if c==27: uid=str(uuid.UUID(bytes=blob[o+8:o+24])).upper()
 if c==25:
  for k in range(struct.unpack_from('<I',blob,o+64)[0]):
   q=o+72+k*80; name=blob[q:q+16].split(b'\0')[0].decode(); va,size,off=struct.unpack_from('<QQI',blob,q+32);sections.append((name,va,size,off))
 o+=n
def rb(va,n):
 for _,v,s,f in sections:
  if v<=va and va+n<=v+s:return blob[f+va-v:f+va-v+n]
 raise ValueError(hex(va))
def cs(va):return rb(va,100).split(b'\0')[0].decode()
def dump(a,z,path=B):
 return subprocess.check_output([OB,'--disassemble','--no-show-raw-insn','--start-address='+hex(a),'--stop-address='+hex(z),str(path)],text=True)
ranges=[(0x1000b4230,0x1000b42b4),(0x1000b44e8,0x1000b4564),(0x100b7de48,0x100b7df10),(0x100b756f8,0x100b757a4),(0x100b7632c,0x100b76428),(0x101c37f2c,0x101c37f94),(0x100b51d50,0x100b51d80),(0x100b558a0,0x100b558d0),(0x100b55a10,0x100b55a40)]
(D/'independent-policy-native-support.asm').write_text('\n'.join(dump(*v) for v in ranges),encoding='utf-8',newline='\n')
textsection=next(s for s in sections if s[0]=='__text'); _,va,n,off=textsection;found={0x100b5d30c:[],0x100b524d0:[]}
for i,(w,) in enumerate(struct.iter_unpack('<I',blob[off:off+n])):
 if w&0x7c000000==0x14000000:
  delta=w&0x3ffffff;delta=(delta-(1<<26) if delta&(1<<25) else delta)*4;t=va+i*4+delta
  if t in found:found[t].append(hex(va+i*4))
assert len(found[0x100b5d30c])==4 and len(found[0x100b524d0])==6
def ins(txt):return [re.sub(r'\s+',' ',re.sub(r'<[^>]*>','',l.split(':',1)[1]).split(';',1)[0]).strip() for l in txt.splitlines() if re.match(r'^[0-9a-f]+:',l)]
old=ins(dump(0x100b5c1fc,0x100b5c3a0,OLD));new=ins(dump(0x100b5c1fc,0x100b5c3a0))
assert [s.replace('#0x850','#0x824') for s in old]==new
imports=subprocess.check_output([OB,'--macho','--indirect-symbols',str(B)],text=True)
resolved=[l.strip() for l in imports.splitlines() if any(a in l for a in ['104b76c14','104b76c20','104b777f0','104b77814'])]
assert any('_memcmp' in l for l in resolved) and any('_strncmp' in l for l in resolved)
jump_byte=rb(0x1051f73fa+14,1)[0]; jump_target=0x101c38500+jump_byte*4
assert jump_target==0x101c3864c
strings={hex(a):cs(a) for a in [0x104bd5e5f,0x104bd5e67,0x104bd581e]}
assert strings['0x104bd5e5f']=='3D View' and strings['0x104bd5e67']=='VIEW3D_OT_zoom' and strings['0x104bd581e']=='Knife Tool Modal Map'
j={'status':'PASS_FRESH_ACTUAL_MACHINE_EVIDENCE','sha256':hashlib.sha256(blob).hexdigest(),'uuid':uid,'text_section':{'va':hex(va),'bytes':n,'file_offset':hex(off)},'immediate_B_BL_calls':{hex(k):v for k,v in found.items()},'imports':resolved,'strings':strings,'native_modal_PANNING15':{'table':'0x1051f73fa','index':14,'byte':jump_byte,'target':hex(jump_target),'actual_native_mode_store':'0x101c38660 customdata+0x3a0=3'},'emulation':{'old':'0x107ef7850','new':'0x107ef7824','instruction_count':len(new),'exact_after_only_latch_offset_relocation':True},'files':{}}
assert j['sha256']=='82c02e1ea9b44b04e4f0f2df5ad9ee2034fe30facdcea298f0b5fbeab6aefa23' and uid=='39FC56CA-D84B-3001-A8B8-6DE301E6B83F'
for p in sorted(D.glob('*.asm')):j['files'][p.name]=hashlib.sha256(p.read_bytes()).hexdigest()
(D/'independent-policy-machine-evidence.json').write_text(json.dumps(j,indent=2)+'\n',encoding='utf-8',newline='\n')
print(json.dumps({k:j[k] for k in ['status','sha256','uuid','emulation','native_modal_PANNING15']}))
