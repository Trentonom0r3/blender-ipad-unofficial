/* SPDX-License-Identifier: GPL-2.0-or-later
 * Geometry fixture instrumentation: registered original owner, font metrics,
 * native matrix conversion and allocator are explicit model boundaries.
 * Production policy/readiness functions are extracted by the Python runner. */
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <cassert>
#include <vector>
#include <memory>
#include <iostream>
float scale=1.25f;int unit=25;
#define UI_SCALE_FAC scale
#define UI_UNIT_X unit
#define UI_UNIT_Y unit
#define UI_PANEL_MARGIN_X (unit*.4f)
#define IFACE_(x) x
struct rcti{int xmin=0,xmax=0,ymin=0,ymax=0;};struct rctf{float xmin=0,xmax=0,ymin=0,ymax=0;};
int BLI_rcti_size_x(const rcti*r){return r->xmax-r->xmin;}int BLI_rcti_size_y(const rcti*r){return r->ymax-r->ymin;}
float BLI_rctf_size_x(const rctf*r){return r->xmax-r->xmin;}float BLI_rctf_size_y(const rctf*r){return r->ymax-r->ymin;}
void BLI_rcti_translate(rcti*r,int x,int y){r->xmin+=x;r->xmax+=x;r->ymin+=y;r->ymax+=y;}
struct ListBase{void*first=nullptr;};
#define LISTBASE_FOREACH(T,var,lb) for(T var=static_cast<T>((lb)->first);var;var=var->next)
enum{RGN_TYPE_WINDOW=1,RGN_TYPE_HUD=2,RGN_FLAG_HIDDEN=1,RGN_FLAG_TOO_SMALL=2,RGN_FLAG_POLL_FAILED=4,UI_BUT_DISABLED=8};
enum class ButType{But,Other};enum class wmIPadKnifeAction{Confirm=1,Cancel=2};
struct wmIPadKnifeOwner{int unused;};struct IPadKnifeHUDAction{wmIPadKnifeOwner owner;wmIPadKnifeAction action;};
struct bContext;static void ipad_knife_hud_action(bContext*,void*,void*){}
struct uiBut{ButType type=ButType::But;decltype(&ipad_knife_hud_action)funcN=ipad_knife_hud_action;void*func_argN=nullptr;int flag=0;rctf rect;};
struct uiBlock{std::vector<std::unique_ptr<uiBut>>buttons;};struct PanelType{int identity=1;};struct PanelRuntime{uiBlock*block=nullptr;};
struct Panel{Panel*next=nullptr;bool active=true;PanelType*type=nullptr;PanelRuntime*runtime=nullptr;};
struct RegionRuntime{bool visible=true,ipad_canvas=true;rcti ipad_canvas_rect;};
struct ARegion{ARegion*next=nullptr;int regiontype=RGN_TYPE_WINDOW,flag=0;RegionRuntime*runtime=nullptr;void*regiondata=nullptr;rcti winrct;ListBase panels;};
struct ScrArea{ListBase regionbase;};struct bContext{ScrArea*area=nullptr;ARegion*original=nullptr;};
ScrArea*CTX_wm_area(const bContext*C){return C->area;}ARegion*ipad_knife_hud_origin(const bContext*C){return C->original;}
int BLI_findindex(const ListBase*l,const void*p){int n=0;for(auto*q=static_cast<ARegion*>(l->first);q;q=q->next,++n)if(q==p)return n;return -1;}
struct uiFontStyle{};struct uiStyle{uiFontStyle widget;};const uiStyle*UI_style_get_dpi(){static uiStyle style;return &style;}
int UI_fontstyle_string_width(const uiFontStyle*,const char*text){return int((std::strcmp(text,"Finish Knife")==0?78:84)*scale);}
bool UI_panel_is_active(const Panel*p){return p->active;}bool UI_ipad_knife_hud_panel_type(const PanelType*p){return p&&p->identity==1;}
void ui_block_to_window_rctf(const ARegion*,const uiBlock*,rctf*out,const rctf*in){*out=*in;}
