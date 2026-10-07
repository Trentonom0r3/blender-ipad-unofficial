"""Run in stock Blender: exact packaged native labels/font + shipped C++ fitter.

This measures BLF advance/glyph height, not the patched native GPU renderer or
iPad acceptance. Native bearing/receipt behavior is covered by source fixtures.
"""
from pathlib import Path
import hashlib
import json
import subprocess
import tempfile
import types
import zipfile
import bpy
import blf
from bl_ui.space_toolsystem_common import ToolSelectPanelHelper

repo=Path(__file__).resolve().parents[1]
ipa=Path(r'C:/Users/tjerf/AppData/Local/Temp/blender-ipad-run-37181963133/Blender-iPad-Unofficial.ipa')
output=repo/'output/ui-preview/pencil-ring-foundation'
output.mkdir(parents=True,exist_ok=True)
with zipfile.ZipFile(ipa) as archive:
    toolbar=archive.read(next(n for n in archive.namelist() if n.endswith('/scripts/startup/bl_ui/space_toolsystem_toolbar.py')))
    font_bytes=archive.read(next(n for n in archive.namelist() if n.endswith('/datafiles/fonts/Inter.woff2')))
target=types.ModuleType('pinned_tool_labels')
target.__package__='bl_ui'
exec(compile(toolbar,'pinned-toolbar.py','exec'),target.__dict__)
original=ToolSelectPanelHelper._tool_class_from_space_type
ToolSelectPanelHelper._tool_class_from_space_type=staticmethod(lambda space:target.VIEW3D_PT_tools_active if space=='VIEW_3D' else original(space))
target.VIEW3D_PT_tools_active.register()
area=next(a for a in bpy.context.window.screen.areas if a.type=='VIEW_3D')
region=next(r for r in area.regions if r.type=='WINDOW')
labels={'Layout / Mode','Tools','Undo','Redo','Select','Workspaces','Object Mode','Edit Mode','Sculpt Mode','Vertex Paint','Weight Paint','Texture Paint','Replace','Add','Remove','Fine','Snap','Numbers','Base','Native Controls','Brush Assets','Layouts','Flythrough','More','Free','X','Y','Z','Vertex','Edge','Face','Clear','Invert'}
counts={}
with bpy.context.temp_override(area=area,region=region):
    for mode in ('OBJECT','EDIT','SCULPT','VERTEX_PAINT','WEIGHT_PAINT','TEXTURE_PAINT'):
        if bpy.context.object.mode!='OBJECT':bpy.ops.object.mode_set(mode='OBJECT')
        if mode!='OBJECT':bpy.ops.object.mode_set(mode=mode)
        tools=[t for t in target.VIEW3D_PT_tools_active._tools_flatten_with_dynamic(target.VIEW3D_PT_tools_active.tools_from_context(bpy.context),context=bpy.context) if t is not None]
        counts[bpy.context.mode]=len(tools)
        labels.update(t.label for t in tools)
patch=(repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
section=patch.split('diff --git a/source/blender/editors/interface/interface_ipad_tool_ring.hh b/source/blender/editors/interface/interface_ipad_tool_ring.hh\n',1)[1].split('diff --git ',1)[0]
header=''.join(line[1:] for line in section.splitlines(True) if line.startswith('+') and not line.startswith('+++'))
with tempfile.TemporaryDirectory(prefix='pencil-label-font-audit-') as directory:
    work=Path(directory)
    font_path=work/'Inter.woff2';font_path.write_bytes(font_bytes)
    font=blf.load(str(font_path))
    metrics={}
    for label in labels:
        for scale in (1,.95,.9):
            blf.size(font,11*scale)
            for start in range(len(label)):
                for end in range(start+1,len(label)+1):
                    text=label[start:end]
                    key=(scale,text)
                    if key not in metrics:metrics[key]=blf.dimensions(font,text)
    table=work/'metrics.txt'
    table.write_text(''.join(f'M {scale} {text.encode().hex()} {width:.8f} {height:.8f}\n' for (scale,text),(width,height) in metrics.items())+''.join(f'L {label.encode().hex()}\n' for label in sorted(labels)),encoding='utf-8')
    (work/'interface_ipad_tool_ring.hh').write_text(header,encoding='utf-8')
    source=r'''
#include "interface_ipad_tool_ring.hh"
#include <fstream>
#include <iostream>
#include <map>
#include <sstream>
using namespace blender::ui::ipad;
std::string decode(std::string s){std::string r;for(size_t i=0;i<s.size();i+=2)r+=char(std::stoi(s.substr(i,2),nullptr,16));return r;}
std::string encode(std::string_view s){const char *h="0123456789abcdef";std::string r;for(unsigned char c:s){r+=h[c>>4];r+=h[c&15];}return r;}
int main(int argc,char **argv){if(argc!=4)return 1;std::ifstream input(argv[1]);std::string kind,key;float scale,width,height;
 std::map<std::pair<int,std::string>,RingLabelMetrics> metrics;std::vector<std::string> labels;
 while(input>>kind){if(kind=="M"){input>>scale>>key>>width>>height;metrics[{int(std::round(scale*100)),decode(key)}]={width,0,0,height};}else{input>>key;labels.push_back(decode(key));}}
 for(auto &label:labels){auto fit=ring_label_fit(label,std::stof(argv[2]),std::stof(argv[3]),1,[&](std::string_view text,float size){return metrics.at({int(std::round(size*100)),std::string(text)});});
  std::cout<<encode(label)<<' '<<fit.fits<<' '<<fit.scale<<' '<<fit.height;for(auto &line:fit.lines)std::cout<<' '<<encode(line.text);std::cout<<'\n';}
}
'''
    (work/'audit.cc').write_text(source,encoding='utf-8')
    binary=work/'audit.exe'
    subprocess.run([r'C:/Program Files/LLVM/bin/clang++.exe','-std=c++17','-Wall','-Wextra','-Werror',str(work/'audit.cc'),'-o',str(binary)],check=True)
    results={}
    # Includes native toolbar icon, icon padding, text margin and one-pixel
    # label insets. Width 44 matches the candidate at UI_UNIT_X=20; 38 and 48
    # are bounded exploratory comparisons, not other source geometries.
    for width in (38,44,48):
        raw=subprocess.check_output([str(binary),str(table),str(width),'32'],text=True,encoding='utf-8')
        rows=[]
        for line in raw.splitlines():
            key,fit,scale,height,*lines=line.split()
            rows.append({'label':bytes.fromhex(key).decode(),'fits':bool(int(fit)),'scale':float(scale),'height':float(height),'lines':[bytes.fromhex(s).decode() for s in lines]})
        results[str(width)]={'failed':[r['label'] for r in rows if not r['fits']],'rows':rows}
    blf.unload(str(font_path))
report={'evidence':'stock Blender BLF dimensions of exact packaged Inter font and native tool labels, executed by shipped C++ fitter; bounds bearings use native source fixtures; no patched GPU/target/device claim',
        'stock_host_version':bpy.app.version_string,'font_sha256':hashlib.sha256(font_bytes).hexdigest(),'target_toolbar_sha256':hashlib.sha256(toolbar).hexdigest(),
        'patch_sha256':hashlib.sha256(patch.encode()).hexdigest(),'native_inventory_counts':counts,'unique_labels':len(labels),'sizes':results}
(output/'native-label-measurements.json').write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
print(json.dumps({'labels':len(labels),'failures':{k:v['failed'] for k,v in results.items()}}))
