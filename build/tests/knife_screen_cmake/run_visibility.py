"""Evaluate actual Blender CMake visibility using source-only library stand-ins.
Real pinned native include/link helpers and CMakeLists execute unchanged. Native
library .cc/.mm source sets are replaced with one dummy/probe body per target.
No header body or include directory list is invented by this fixture.
"""
from pathlib import Path
from datetime import datetime,timezone
import argparse,ctypes,hashlib,json,os,re,shlex,shutil,subprocess,sys,time,tempfile
sys.dont_write_bytecode=True
parser=argparse.ArgumentParser()
parser.add_argument('--repo',type=Path,default=Path.cwd())
parser.add_argument('--source-root',type=Path)
parser.add_argument('--cache-dir',type=Path)
parser.add_argument('--output-dir',type=Path,default=Path(tempfile.mkdtemp(prefix='knife-pan-screen-cmake-run-')))
args=parser.parse_args();repo=args.repo.resolve();src=args.source_root.resolve() if args.source_root else None;out=args.output_dir.resolve();out.mkdir(parents=True,exist_ok=True)
if(out/'report.json').exists():(out/'report.json').rename(out/f'previous-report-{time.time_ns()}.json')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def run(command,cwd,log):
 result=subprocess.run(command,cwd=cwd,capture_output=True,text=True)
 log.write_text(result.stdout+result.stderr,encoding='utf-8',newline='\n')
 return result
inputs=Path(__file__).resolve().parent/'inputs'
provenance=json.loads((inputs/'provenance.json').read_text())
failed_sha=provenance['failed_source_commit']
baseline_patch_sha256=provenance['baseline_patch_sha256']
sys.path.insert(0,str(repo/'build'));import preflight,test_touch_extrude as touch
pin=preflight.pinned_commit(repo);cache=args.cache_dir.resolve() if args.cache_dir else repo/'.cache/preflight';touch.PIN_ROOT=cache/pin;touch.changed_source.cache_clear()
CURRENT_INPUTS={}
def current(rel):
 if rel not in CURRENT_INPUTS:
  if src:raw=(src/rel).read_text(encoding='utf-8').encode('utf-8')
  else:
   marker=f'diff --git a/{rel} b/{rel}\n'
   if marker in touch.PATCH_TEXT:
    section=touch.PATCH_TEXT.split(marker,1)[1].split('diff --git ',1)[0]
    if '\n--- /dev/null\n'not in '\n'+section:preflight.get_source(pin,rel,cache,False)
    raw=touch.changed_source(rel).encode()
   else:raw=preflight.get_source(pin,rel,cache,False)
  CURRENT_INPUTS[rel]=raw
 return CURRENT_INPUTS[rel]
screen_path='source/blender/editors/screen/CMakeLists.txt';wm_path='source/blender/windowmanager/CMakeLists.txt'
old_screen=(inputs/'failed-screen-CMakeLists.txt').read_text();fixed_screen=current(screen_path).decode();wm=current(wm_path).decode()
assert hashlib.sha256(old_screen.encode('utf-8')).hexdigest()==provenance['failed_screen_cmake_normalized_sha256']
assert 'list(APPEND LIB PRIVATE bf_intern_ghost)'not in old_screen
assert 'if(WITH_APPLE_CROSSPLATFORM)\n  list(APPEND LIB PRIVATE bf_intern_ghost)\nendif()'in fixed_screen
for rel in ['build_files/cmake/macros.cmake','intern/ghost/CMakeLists.txt']:
 preflight.get_source(pin,rel,cache,False)
macros=cache/pin/'build_files/cmake/macros.cmake';ghost=cache/pin/'intern/ghost/CMakeLists.txt'
assert sha(macros)=='2e3ac4fec4bcf8e2f6b16cc777d23dce2412ab37b41d9e756d5bfd175f133911'
assert sha(ghost)=='eb933c960c3c3d431b582de45fc97837f3d226e8ac49abc7fb98ecf0467dce54'
assert 'diff --git a/intern/ghost/CMakeLists.txt 'not in touch.PATCH_TEXT
headers=['intern/ghost/GHOST_NavigationIOS.hh','source/blender/windowmanager/WM_ipad_knife.hh','source/blender/editors/include/ED_ipad_panels.hh']
PROBE=r'''
#include "WM_ipad_knife.hh"
#include "ED_ipad_panels.hh"
#include <array>
#include <cassert>
#include <cstdint>
#include <iostream>
#include <type_traits>
static_assert(std::is_trivial_v<wmIPadKnifeCanvasStamp>);
static_assert(std::is_trivially_copyable_v<wmIPadKnifeCanvasStamp>);
#ifdef WITH_APPLE_CROSSPLATFORM
#include "GHOST_NavigationIOS.hh"
using ProbeAPI=bool (*)(bContext *,wmWindow *,bool,const ghost::ios::PencilKnifePanContact &,ghost::ios::PencilKnifePanContact &);
static_assert(std::is_same_v<decltype(&ED_ipad_knife_pan_probe),ProbeAPI>);
static_assert(std::tuple_size_v<decltype(ghost::ios::PencilKnifePanContact{}.scope)> ==32);
static_assert(std::tuple_size_v<decltype(ghost::ios::PencilKnifePanContact{}.owner)> ==23);
int main(){ghost::ios::PencilKnifePanContact original;assert(!original.valid());original.serial=1;original.content=1;original.intent=ghost::ios::PencilKnifePanIntent::Live;original.owner.fill(1);assert(original.valid());original.intent=ghost::ios::PencilKnifePanIntent::Tool;assert(!original.valid());ghost::ios::set_pencil_knife_pan_probe(nullptr);assert(!ghost::ios::pencil_knife_pan_probe);std::cout<<"actual-full-GHOST-public-header-CXX17 PASS\n";}
#else
#if __has_include("GHOST_NavigationIOS.hh")
#error "Non-Apple screen must not inherit GHOST through WM's private link"
#endif
int main(){wmIPadKnifeCanvasStamp stamp{};assert(!stamp.valid&&!stamp.content);std::cout<<"nonApple-no-GHOST-leak PASS\n";}
#endif
'''
TOP=r'''
cmake_minimum_required(VERSION 3.20)
project(actual_screen_cmake_dependency_probe LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Evaluate native platform conditionals, while compiling the value-only C++
# public-header closure with the available host compiler, not an Apple SDK.
set(APPLE ${FIXTURE_APPLE})
set(APPLE_TARGET_IOS ${FIXTURE_APPLE})
set(WITH_APPLE_CROSSPLATFORM ${FIXTURE_APPLE})
if(FIXTURE_APPLE)
  add_compile_definitions(WITH_APPLE_CROSSPLATFORM)
endif()
include("${CMAKE_SOURCE_DIR}/build_files/cmake/macros.cmake")
add_library(bf_rna INTERFACE)
function(fixture_library name sources includes includes_sys library_deps)
  # Native include/link ownership is unchanged. Other unavailable Blender
  # dependency targets are empty imported interfaces; none grants probe includes.
  foreach(dependency ${library_deps})
    if(dependency MATCHES "^(PRIVATE|PUBLIC|INTERFACE|debug|optimized|general)$")
      continue()
    endif()
    if(dependency MATCHES "^bf" AND NOT TARGET ${dependency} AND
       NOT dependency STREQUAL "bf_editor_screen" AND
       NOT dependency STREQUAL "bf_windowmanager" AND
       NOT dependency STREQUAL "bf_intern_ghost")
      add_library(${dependency} INTERFACE IMPORTED GLOBAL)
    endif()
  endforeach()
  if(name STREQUAL "bf_editor_screen")
    set(body "${CMAKE_SOURCE_DIR}/probe.cc")
  else()
    set(body "${CMAKE_SOURCE_DIR}/dummy.cc")
  endif()
  blender_add_lib__impl(${name} "${body}" "${includes}" "${includes_sys}" "${library_deps}")
  set_property(TARGET ${name} PROPERTY FIXTURE_NATIVE_SOURCES "${sources}")
endfunction()
function(blender_add_lib name sources includes includes_sys library_deps)
  fixture_library("${name}" "${sources}" "${includes}" "${includes_sys}" "${library_deps}")
endfunction()
function(blender_add_lib_nolist name sources includes includes_sys library_deps)
  fixture_library("${name}" "${sources}" "${includes}" "${includes_sys}" "${library_deps}")
endfunction()
add_subdirectory(intern/ghost)
add_subdirectory(source/blender/windowmanager)
add_subdirectory(source/blender/editors/screen)
get_target_property(screen_type bf_editor_screen TYPE)
get_target_property(wm_type bf_windowmanager TYPE)
get_target_property(ghost_type bf_intern_ghost TYPE)
get_target_property(screen_link bf_editor_screen LINK_LIBRARIES)
get_target_property(wm_link bf_windowmanager LINK_LIBRARIES)
get_target_property(wm_interface_link bf_windowmanager INTERFACE_LINK_LIBRARIES)
get_target_property(ghost_public_inc bf_intern_ghost INTERFACE_INCLUDE_DIRECTORIES)
file(WRITE "${CMAKE_BINARY_DIR}/native-target-ownership.txt"
 "screen_type=${screen_type}\nwm_type=${wm_type}\nghost_type=${ghost_type}\nscreen_link=${screen_link}\nwm_link=${wm_link}\nwm_interface_link=${wm_interface_link}\nghost_public_inc=${ghost_public_inc}\n")
file(GENERATE OUTPUT "${CMAKE_BINARY_DIR}/screen-effective-includes.txt"
 CONTENT "$<JOIN:$<TARGET_PROPERTY:bf_editor_screen,INCLUDE_DIRECTORIES>,\n>\n")
'''
compiler=shutil.which('clang++')or shutil.which('g++')or r'C:/Program Files/LLVM/bin/clang++.exe';cmake=shutil.which('cmake');ninja=shutil.which('ninja');assert all([Path(compiler).is_file(),cmake,ninja])
def split_command(command):
 if os.name!='nt':return shlex.split(command)
 shell=ctypes.windll.shell32;kernel=ctypes.windll.kernel32
 shell.CommandLineToArgvW.argtypes=[ctypes.c_wchar_p,ctypes.POINTER(ctypes.c_int)];shell.CommandLineToArgvW.restype=ctypes.POINTER(ctypes.c_wchar_p)
 count=ctypes.c_int();argv=shell.CommandLineToArgvW(command,ctypes.byref(count));result=[argv[i]for i in range(count.value)];kernel.LocalFree(argv);return result
results=[]
for name,corrected,apple in [('old-Apple',False,True),('fixed-Apple',True,True),('old-nonApple',False,False),('fixed-nonApple',True,False)]:
 case=out/name;project=case/'source';build=case/'build2';project.mkdir(parents=True,exist_ok=True)
 for rel in headers:
  target=project/rel;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(current(rel))
 for rel,data in [(screen_path,(fixed_screen if corrected else old_screen).encode()),(wm_path,wm.encode()),('intern/ghost/CMakeLists.txt',ghost.read_bytes()),('build_files/cmake/macros.cmake',macros.read_bytes())]:
  target=project/rel;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
 (project/'CMakeLists.txt').write_text(TOP,encoding='utf-8',newline='\n');(project/'probe.cc').write_text(PROBE,encoding='utf-8',newline='\n');(project/'dummy.cc').write_text('int fixture_source_only_dependency=0;\n',encoding='utf-8',newline='\n')
 configure=[cmake,'-S',str(project),'-B',str(build),'-G','Ninja','-DCMAKE_MAKE_PROGRAM='+ninja,'-DCMAKE_CXX_COMPILER='+compiler,'-DFIXTURE_APPLE='+('ON'if apple else'OFF')]
 if os.name=='nt':
  installed=list(Path(r'C:/Program Files (x86)/Windows Kits/10/bin').glob('*/x64/rc.exe'))
  if installed:
   sdk=max(installed,key=lambda p:tuple(map(int,p.parents[1].name.split('.')))).parent
   configure+=['-DCMAKE_RC_COMPILER='+(sdk/'rc.exe').as_posix(),'-DCMAKE_MT='+(sdk/'mt.exe').as_posix()]
 configured=run(configure,out,case/'configure.log')
 if configured.returncode:raise RuntimeError('CMake configure failed '+name+': '+configured.stderr)
 commands=json.loads((build/'compile_commands.json').read_text());entry=next(x for x in commands if Path(x['file'])==project/'probe.cc');argv=entry.get('arguments')or split_command(entry['command'])
 filtered=[];skip=False
 for i,value in enumerate(argv):
  if skip:skip=False;continue
  if value=='-o':skip=True;continue
  if value=='-c':continue
  filtered.append(value)
 filtered+=['-fsyntax-only'];compiled=run(filtered,Path(entry['directory']),case/'syntax.log')
 includes=(build/'screen-effective-includes.txt').read_text();normalized=includes.replace(project.as_posix(),'$SOURCE').replace(build.as_posix(),'$BINARY')
 ownership=(build/'native-target-ownership.txt').read_text();assert 'wm_type=STATIC_LIBRARY'in ownership and '$<LINK_ONLY:bf_intern_ghost>'in ownership
 ghost_visible=str(project/'intern/ghost').replace('\\','/')in includes.replace('\\','/')
 expected_success=corrected or not apple
 assert (compiled.returncode==0)==expected_success,(name,compiled.stderr)
 if not expected_success:assert 'GHOST_NavigationIOS.hh' in compiled.stderr and ('file not found'in compiled.stderr or 'No such file or directory'in compiled.stderr),compiled.stderr
 assert ghost_visible==(corrected and apple),(name,includes)
 runtime=None
 if expected_success:
  exe=case/('actual-public-header.exe'if os.name=='nt'else'actual-public-header');link_argv=[v for v in filtered if v!='-fsyntax-only']+['-o',str(exe)]
  linked=run(link_argv,Path(entry['directory']),case/'public-header-compile-link.log');assert linked.returncode==0,linked.stderr
  executed=run([str(exe)],case,case/'execute.log');assert executed.returncode==0,executed.stderr;runtime=executed.stdout.strip()
 results.append({'case':name,'corrected':corrected,'AppleCrossPlatform':apple,'configure_returncode':configured.returncode,'syntax_returncode':compiled.returncode,'expected_success':expected_success,'Ghost_public_include_visible':ghost_visible,'normalized_screen_includes':normalized.splitlines(),'ownership':ownership,'compiler_arguments':filtered,'runtime':runtime,'source_cmake_sha256':sha(project/screen_path)})
 assert sha(project/'intern/ghost/GHOST_NavigationIOS.hh')==hashlib.sha256(current('intern/ghost/GHOST_NavigationIOS.hh')).hexdigest()
assert results[2]['normalized_screen_includes']==results[3]['normalized_screen_includes']
report={'status':'PASS_ACTUAL_CMAKE_VISIBILITY_OLD_FAILURE_FIXED_SUCCESS_NONAPPLE_UNCHANGED','utc':datetime.now(timezone.utc).isoformat(),'failed_source_commit':failed_sha,'failed_native_run':40229369141,'baseline_patch_sha256':baseline_patch_sha256,'input_hashes':{rel:hashlib.sha256(raw).hexdigest()for rel,raw in CURRENT_INPUTS.items()},'fixture_input_hashes':{str(p):hashlib.sha256(p.read_text(encoding='utf-8').encode('utf-8')).hexdigest()for p in [inputs/'failed-screen-CMakeLists.txt',inputs/'provenance.json']},'pinned_cmake_hashes':{str(p):sha(p)for p in [macros,ghost]},'script_sha256':sha(Path(__file__)),'native_cmake_sources':'Exact failed screenCMake snapshot originally reconstructed from failed commit patch+pin. Exact corrected screenCMake and WM CMake now read from current source-root or authoritative current patch+pin without Temp/externalGit dependency. GhostCMake and all macros are explicitly acquired by preflight.get_source at the current workflow pin, with exact expected pin hashes. Baseline CMake and JSON are text-normalized hashes for LF/CRLF checkout portability. Actual CMake evaluates all three CMakeLists; actual blender_add_lib__impl/blender_target_include_dirs/blender_link_libraries semantics generate compilecommands.','compiler':subprocess.check_output([compiler,'--version'],text=True),'results':results,'nonApple_include_sets_identical':True,'actual_full_GHOST_header_used':True,'no_fake_header_body':True,'no_fabricated_include_flags':True,'limits':['Native library source lists alone are replaced with one dummy or probe source; real STATIC ownership, current publicheaders, native CMake include/link helper bodies and target scoping execute. Other unavailable Blender librarytargets are empty imported interfaces granting no probe includes.','Host C++17 syntax/compile/link/runtime of complete actual value-only GHOST header and public WM/ED header closure only. No complete screen_ipad_panels.cc translationunit, Apple SDK/ObjectiveC++/Xcode/nativeIPA build, renderer/UIKit/device proof.','Native Apple conditionals are evaluated explicitly on the host; this is include dependency regression proof, not cross compiler/ABI/package verification.','No repository/source/test/patch/builddispatch/commit edits performed by this isolated fixture.']}
report_path=out/'report.json';report_path.write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
print(json.dumps({'status':report['status'],'root':str(out),'report_sha256':sha(report_path),'cases':[{k:r[k]for k in ['case','syntax_returncode','Ghost_public_include_visible','runtime']}for r in results]},indent=2))
