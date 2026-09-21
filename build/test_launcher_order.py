"""Compile the actual launcher ordering helpers against native identity mocks."""
from pathlib import Path
import unittest
import test_ipad_panels

class LauncherOrderTests(unittest.TestCase):
    def test_identity_hidden_entries_and_stale_actions(self):
        repo = Path(__file__).resolve().parents[1]
        patch = (repo/'patches/blender-ipad.patch').read_text(encoding='utf-8')
        name = 'source/blender/editors/screen/screen_ipad_panels.cc'
        section = patch.split(f'diff --git a/{name} b/{name}\n',1)[1].split('diff --git ',1)[0]
        source = ''.join(l[1:] for l in section.splitlines(True) if l.startswith('+') and not l.startswith('+++'))
        helpers = source[source.index('static int *launcher_rank'):source.index('static Model make_model')]
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(PREFIX + helpers + CASES)

PREFIX = r'''
#include "ipad_workspace_panels.hh"
#include <cassert>
#include <climits>
#include <cstdint>
#include <cstring>
#include <string>
#include <iostream>
using Edge=blender::ed::ipad::panels::Edge;
struct iPadPanelOrder {iPadPanelOrder *next=nullptr,*prev=nullptr;int kind=0,rank=0;char category[64]{};};
struct ScrArea {ScrArea *next=nullptr;int ipad_launcher_order=0,spacetype=1;struct {std::uint64_t ipad_launcher_session=0;} runtime;};
struct ListBase {void *first=nullptr,*last=nullptr;};
struct bScreen {struct {unsigned int session_uid=1;} id;int ipad_panel_owner=0;ListBase areabase,ipad_panel_order;};
struct Tab {int id;Edge edge;std::string label;ScrArea *area;int region_type;std::string category;};
struct Model {std::vector<Tab> tabs;ScrArea *main=nullptr;};
constexpr int tools_id=1000000,shelf_id=1000001;
#define LISTBASE_FOREACH(type,name,list) for(type name=static_cast<type>((list)->first);name;name=name->next)
#define STRNCPY(dst,src) do { const auto count=std::min(sizeof(dst)-1,std::strlen(src)); std::copy_n(src,count,dst); dst[count]=0; } while(false)
template<class T>T *MEM_callocN(const char *){return new T{};}
void BLI_addtail(ListBase *list,iPadPanelOrder *entry){
 auto *last=static_cast<iPadPanelOrder *>(list->last);entry->prev=last;
 if(last)last->next=entry;else list->first=entry;list->last=entry;
}
'''
CASES = r'''
int main(){
 bScreen screen;ScrArea a,b;a.next=&b;a.runtime.ipad_launcher_session=11;b.runtime.ipad_launcher_session=12;
 screen.areabase={&a,&b};Model model;
 model.main=&a;
 model.tabs={{tools_id,Edge::Tools,"Tools",&a,1,""},
             {0,Edge::Bottom,"Nodes",&a,0,""},{1,Edge::Bottom,"Nodes",&b,0,""},
             {shelf_id,Edge::Bottom,"Brushes",&a,2,""},
             {1000010,Edge::Side,"Item",&a,3,"Item"},{1000011,Edge::Side,"View",&a,3,"View"}};
 const auto original=model.tabs;
 sort_launchers(&screen,model);assert(launcher_key(model.tabs[0])=="tools");
 auto move=[&](const std::string &key,int direction){
   bool result=move_launcher(&screen,model,key,launcher_signature(&screen,model),direction);
   sort_launchers(&screen,model);return result;
 };
 assert(move("tools",1));assert(launcher_key(model.tabs[0])=="editor:11");
 assert(launcher_key(model.tabs[1])=="tools");
 assert(move("editor:12",-1));assert(launcher_key(model.tabs[1])=="editor:12");
 assert(a.next==&b && screen.areabase.first==&a); // Native editor order unchanged.
 assert(move("category:View",-1));
 std::vector<std::string> right;
 for(const auto &t:model.tabs)if(t.edge==Edge::Side)right.push_back(launcher_key(t));
 assert((right==std::vector<std::string>{"category:View","category:Item"}));
 // Hidden entries retain their ranks; other movement must not erase them.
 const auto hidden=*std::find_if(model.tabs.begin(),model.tabs.end(),[](const auto &t){return t.category=="Item";});
 model.tabs.erase(std::remove_if(model.tabs.begin(),model.tabs.end(),[](const auto &t){return t.category=="Item";}),model.tabs.end());
 assert(move("tools",1));assert(*launcher_rank(&screen,hidden,false)>0);
 model.tabs.push_back(hidden);sort_launchers(&screen,model);
 assert(!move("category:View",-1)); // Cannot cross physical rails.
 assert(!move("missing",1));assert(!move("tools",0));
 // Generated category IDs may change while stable native category ordering survives.
 for(auto &t:model.tabs)if(t.category=="Item")t.id=1000099;
 assert(launcher_key(*std::find_if(model.tabs.begin(),model.tabs.end(),[](const auto &t){return t.category=="Item";}))=="category:Item");
 const auto signature=launcher_signature(&screen,model);
 ++screen.id.session_uid;assert(!move_launcher(&screen,model,"tools",signature,1));--screen.id.session_uid;
 ++a.runtime.ipad_launcher_session;assert(!move_launcher(&screen,model,"tools",signature,1));--a.runtime.ipad_launcher_session;
 ++b.spacetype;assert(!move_launcher(&screen,model,"tools",signature,1));--b.spacetype;
 model.tabs.pop_back();assert(!move_launcher(&screen,model,"tools",signature,1));
 model.tabs=original;sort_launchers(&screen,model);
 // Rank normalization remains bounded, unique and reversible over repeated edits.
 for(int i=0;i<100;++i){assert(move("category:View",1));assert(move("category:View",-1));}
 std::vector<int> ranks;for(const auto &t:model.tabs)ranks.push_back(*launcher_rank(&screen,t,false));
 std::sort(ranks.begin(),ranks.end());assert(std::adjacent_find(ranks.begin(),ranks.end())==ranks.end());
 assert(ranks.front()==1 && ranks.back()==6);
 auto *entry=static_cast<iPadPanelOrder *>(screen.ipad_panel_order.first);
 while(entry){auto *next=entry->next;delete entry;entry=next;}
 std::cout<<"PASS: launcher rails, stable identity, hidden entries, stale actions and reversal\n";
}
'''
