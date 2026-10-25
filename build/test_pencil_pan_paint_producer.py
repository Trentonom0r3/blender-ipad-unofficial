"""Execute the current Pencil pan producer through GHOST, WM and native slices.

Run directly with --repo PATH [--cache-dir PATH] [--output-dir PATH]. The
actual corrected overlay is required; the historical producer is a separate
failure control. Every runtime pinned input is acquired explicitly.
UIKit messages/scheduling, initial brush setup, coordinate/tablet transforms,
generic stroke_done dispatch, wm_operator_finished and BKE effects remain instrumentation boundaries.
No device, geometry, history, universal rollback or Undo proof is claimed.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import unittest

DEFAULT_REPO = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--repo', type=Path, default=DEFAULT_REPO)
parser.add_argument('--cache-dir', type=Path)
parser.add_argument('--output-dir', type=Path)
OPTIONS, UNITTEST_ARGS = parser.parse_known_args()
REPO = OPTIONS.repo.resolve()
OUT = OPTIONS.output_dir.resolve() if OPTIONS.output_dir else Path(tempfile.mkdtemp(prefix='pencil-pan-producer-'))
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'build'))


def load_helper(name):
    path = REPO / 'build' / (name + '.py')
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


preflight = load_helper('preflight')
touch = load_helper('test_touch_extrude')
function = load_helper('test_compact_shelf').function
PIN = preflight.pinned_commit(REPO)
SOURCE_PATHS = (
    'intern/ghost/intern/GHOST_WindowIOS.mm',
    'intern/ghost/GHOST_NavigationIOS.hh',
    'intern/ghost/intern/GHOST_EventButton.hh',
    'intern/ghost/intern/GHOST_EventCursor.hh',
    'source/blender/windowmanager/intern/wm_event_system.cc',
    'source/blender/editors/sculpt_paint/sculpt.cc',
    'source/blender/editors/sculpt_paint/paint_vertex.cc',
    'source/blender/editors/sculpt_paint/paint_weight.cc',
    'source/blender/editors/sculpt_paint/paint_image_ops_paint.cc',
    'source/blender/editors/sculpt_paint/paint_stroke.cc',
)
NEW_FILES = {p for p, needed in preflight.patch_files(touch.PATCH_TEXT) if not needed}
CACHE = OPTIONS.cache_dir.resolve() if OPTIONS.cache_dir else REPO / '.cache/preflight'
INPUTS = {}
for source_path in SOURCE_PATHS:
    if source_path not in NEW_FILES:
        INPUTS[source_path] = preflight.get_source(PIN, source_path, CACHE, False).decode('utf-8')
touch.PIN_ROOT = CACHE / PIN
touch.changed_source.cache_clear()


def source(path):
    marker = f'diff --git a/{path} b/{path}\n'
    return touch.changed_source(path) if marker in touch.PATCH_TEXT else INPUTS[path]


def between(text, start, end):
    a = text.index(start)
    return text[a:text.index(end, a)]


def block(text, marker, occurrence=0):
    starts = [m.start() for m in re.finditer(re.escape(marker), text)]
    start = starts[occurrence]
    opening = text.index('{', start)
    depth = 0
    for n in range(opening, len(text)):
        depth += (text[n] == '{') - (text[n] == '}')
        if not depth:
            return text[start:n + 1]
    raise AssertionError(marker)


IOS = source(SOURCE_PATHS[0])
NAV = source(SOURCE_PATHS[1])
WM = source(SOURCE_PATHS[4])
PAN = function(IOS, '- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{')
# Exact reconstructed pre-correction producer from overlay44dbc, Blender pin above.
HISTORICAL_PAN = '- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender\n{\n  if (![sender touchStreamAllowed]) {\n    return;\n  }\n  /* A hardware drag owns the shared pointer until its matched release.\n   * Suppress this entire newly started touch stream, even if it outlasts that release. */\n  if (sender.state == UIGestureRecognizerStateBegan &&\n      (mouse_left_pressed || mouse_middle_pressed || mouse_right_pressed)) {\n    pointer_hud_contact = {};\n    pointer_capture.begin(ghost::ios::PointerCaptureKind::None);\n    pointer_capture.ended = true;\n    return;\n  }\n  CGPoint touch_point = [sender getScaledTouchPoint:window];\n  CGPoint translation = [sender getScaledTranslation:window];\n  const bool pencil_pan = [sender gestureUsesPencil];\n  const GHOST_TabletData gesture_tablet = ios_tablet_snapshot([sender pencilSample]);\n\n  if (sender.state == UIGestureRecognizerStateBegan) {\n    ring_capture = [sender ringContact];\n    if (ring_capture.captured) {\n      ios_ring_packet(system, window, ring_capture, GHOST_kPencilRingBegin,\n                      CGPointMake(ring_capture.origin_x, ring_capture.origin_y));\n    }\n  }\n  if (ring_capture.ended) return;\n  if (ring_capture.captured) {\n    const bool terminal = sender.state == UIGestureRecognizerStateEnded ||\n        sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateFailed;\n    if (terminal) {\n      const auto phase = sender.state == UIGestureRecognizerStateEnded ?\n          GHOST_kPencilRingEnd : GHOST_kPencilRingCancel;\n      ios_ring_packet(system, window, ring_capture, phase, touch_point);\n      ring_capture.finish();\n    }\n    else ios_ring_packet(system, window, ring_capture, GHOST_kPencilRingMotion, touch_point);\n    return; /* Never synthesize mouse presses, scrolling or an ordinary release. */\n  }\n  if (pencil_pan) tablet_data = gesture_tablet;\n  /* Use the rendered navigation hit rectangles, not a fixed screen corner.\n   * Start at the actual touch origin: UIKit recognizes a pan only after movement,\n   * which can already put a Pencil/finger outside a small round button. */\n  if (sender.state == UIGestureRecognizerStateBegan) {\n    pointer_hud_contact = [sender hudContact];\n    pointer_finger_contact = [sender gestureUsesFinger];\n    const auto hud = pointer_hud_contact;\n    CGPoint origin = hud.generation ? CGPointMake(hud.x, hud.y) :\n        CGPointMake(touch_point.x - translation.x, touch_point.y - translation.y);\n    pointer_capture.begin(ghost::ios::pointer_capture_hit(\n        window, int(origin.x), int(origin.y), !GHOST_IOS_get_flythrough_mode()));\n    if (hud.generation) pointer_capture.begin(ghost::ios::PointerCaptureKind::Navigation);\n    if (pointer_capture.active()) {\n      UserInputEvent begin(&origin, nullptr, nullptr, pencil_pan);\n      if (pencil_pan) begin.set_tablet_snapshot(gesture_tablet);\n      begin.direct_finger = pointer_finger_contact;\n      begin.hud_generation = hud.generation;\n      begin.hud_serial = hud.serial;\n      begin.direct_tool = pointer_capture.kind == ghost::ios::PointerCaptureKind::ToolManipulation;\n      begin.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n      begin.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);\n      [self generateUserInputEvents:begin];\n    }\n  }\n  if (pointer_capture.ended) {\n    return;\n  }\n  if (pointer_capture.active()) {\n    UserInputEvent pointer(&touch_point, nullptr, nullptr, pencil_pan);\n    if (pencil_pan) pointer.set_tablet_snapshot(gesture_tablet);\n    pointer.direct_finger = pointer_finger_contact;\n    pointer.hud_generation = pointer_hud_contact.generation;\n    pointer.hud_serial = pointer_hud_contact.serial;\n    pointer.direct_tool = pointer_capture.kind == ghost::ios::PointerCaptureKind::ToolManipulation;\n    pointer.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n    if (sender.state == UIGestureRecognizerStateEnded ||\n        sender.state == UIGestureRecognizerStateCancelled ||\n        sender.state == UIGestureRecognizerStateFailed) {\n      const auto end = pointer_capture.finish(sender.state != UIGestureRecognizerStateEnded);\n      pointer.cancelled = end.cancelled;\n      if (end.release) {\n        pointer.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);\n      }\n    }\n    [self generateUserInputEvents:pointer];\n    if (pointer_capture.ended) { pointer_hud_contact = {}; pointer_finger_contact = false; }\n    return;\n  }\n  /* Finger motion outside navigation is scrolling. Keep the\n   * event position at the gesture origin so scrolling across another control\n   * cannot retarget the gesture. Pencil continues through the precision path. */\n  if (!pencil_pan) {\n    if (GHOST_IOS_get_flythrough_mode()) {\n      /* Flythrough mode: 1-finger drag looks around (orbits/tilts camera). */\n      if (sender.state == UIGestureRecognizerStateBegan) {\n        [sender setCachedTranslation:translation];\n        mouse_cursor_x = touch_point.x;\n        mouse_cursor_y = touch_point.y;\n        UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);\n        cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n        [self generateUserInputEvents:cursor_info];\n      }\n      else if (sender.state == UIGestureRecognizerStateChanged) {\n        CGPoint rel_tran = [sender getRelativeTranslation:translation];\n        [sender setCachedTranslation:translation];\n        if (!CGPointEqualToPoint(rel_tran, CGPointZero)) {\n          UserInputEvent event_info(&touch_point, &rel_tran, nullptr, false);\n          event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE_TWO_FINGERS);\n          [self generateUserInputEvents:event_info];\n        }\n      }\n      else if (sender.state == UIGestureRecognizerStateEnded ||\n               sender.state == UIGestureRecognizerStateCancelled ||\n               sender.state == UIGestureRecognizerStateFailed)\n      {\n        [sender setCachedTranslation:CGPointMake(0.0f, 0.0f)];\n        /* End the anchored pan stream so UI gesture captures cannot leak into\n         * a later trackpad scroll or another finger gesture. */\n        UserInputEvent cursor_info(&touch_point, nullptr, nullptr, false);\n        cursor_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n        [self generateUserInputEvents:cursor_info];\n      }\n      return;\n    }\n    CGPoint origin = CGPointMake(touch_point.x - translation.x,\n                                 touch_point.y - translation.y);\n    UserInputEvent scroll_info(&origin, nullptr, nullptr, false);\n    if (sender.state == UIGestureRecognizerStateBegan) {\n      [sender setCachedTranslation:translation];\n      scroll_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n    }\n    else if (sender.state == UIGestureRecognizerStateChanged) {\n      scroll_info.translation = [sender getRelativeTranslation:translation];\n      [sender setCachedTranslation:translation];\n      if (!CGPointEqualToPoint(scroll_info.translation, CGPointZero)) {\n        scroll_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE);\n      }\n    }\n    else if (sender.state == UIGestureRecognizerStateEnded ||\n             sender.state == UIGestureRecognizerStateCancelled ||\n             sender.state == UIGestureRecognizerStateFailed)\n    {\n      scroll_info.location = touch_point;\n      scroll_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n    }\n    [self generateUserInputEvents:scroll_info];\n    return;\n  }\n  UserInputEvent event_info(&touch_point, nullptr, nullptr, pencil_pan);\n  if (pencil_pan) {\n    event_info.set_tablet_snapshot(gesture_tablet);\n    event_info.pencil_paint = [sender pencilPaintContact];\n  }\n\n  if (sender.state == UIGestureRecognizerStateBegan ||\n      sender.state == UIGestureRecognizerStateChanged)\n  {\n    /* Register initial click for click and drag support. */\n    if (sender.state == UIGestureRecognizerStateBegan) {\n      /* Set inital translation */\n      [sender setCachedTranslation:translation];\n      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n      event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_DOWN);\n    }\n\n    /* Calculate translation change since last begin/change event */\n    CGPoint relative_translation = [sender getRelativeTranslation:translation];\n    /* Update cached translation */\n    [sender setCachedTranslation:translation];\n    /* Send pan event if non zero */\n    if (!CGPointEqualToPoint(relative_translation, CGPointMake(0.0f, 0.0f))) {\n      event_info.translation = relative_translation;\n      event_info.add_event(UserInputEvent::EventTypes::PAN_GESTURE);\n    }\n\n    /* Update cursor position on change */\n    if (sender.state == UIGestureRecognizerStateChanged) {\n      event_info.add_event(UserInputEvent::EventTypes::CURSOR_MOVE);\n    }\n  }\n\n  /* Mouse release for pan. */\n  if (sender.state == UIGestureRecognizerStateEnded ||\n      sender.state == UIGestureRecognizerStateCancelled ||\n      sender.state == UIGestureRecognizerStateFailed)\n  {\n    event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);\n  }\n  [self generateUserInputEvents:event_info];\n}'
HISTORICAL_PRODUCER_SHA256 = '85bf405c365a0bbe0e0b88bb20e3d3c8ccfbe4b31a2e81801bd35976bfe1dcb6'
assert hashlib.sha256(HISTORICAL_PAN.encode()).hexdigest() == HISTORICAL_PRODUCER_SHA256
SUFFIX_MARKER = '  UserInputEvent event_info(&touch_point, nullptr, nullptr, pencil_pan);'
PREFIX, SUFFIX = HISTORICAL_PAN.split(SUFFIX_MARKER, 1)
SUFFIX = SUFFIX_MARKER + SUFFIX
OLD_MOVEMENT = 'if (!CGPointEqualToPoint(relative_translation, CGPointMake(0.0f, 0.0f))) {'
NEW_MOVEMENT = ('if (!event_info.pencil_paint.valid() && !omit_knife_paired_pan &&\n'
                '        !CGPointEqualToPoint(relative_translation, CGPointMake(0.0f, 0.0f))) {')
OLD_TERMINAL = '    event_info.add_event(UserInputEvent::EventTypes::LEFT_BUTTON_UP);'
NEW_TERMINAL = ('    event_info.cancelled = event_info.pencil_paint.valid() &&\n'
                '                           sender.state != UIGestureRecognizerStateEnded;\n' + OLD_TERMINAL)
assert SUFFIX.count(OLD_MOVEMENT) == SUFFIX.count(OLD_TERMINAL) == 1
CORRECTED_SUFFIX = SUFFIX.replace(OLD_MOVEMENT, NEW_MOVEMENT).replace(OLD_TERMINAL, NEW_TERMINAL)
# The source oracle describes the new declared Knife extension; it is NEVER
# used as the executed producer. CORRECTED_PAN below remains actual PAN.
# This retained brush fixture has no original Knife actor/owner. The full new
# Knife positive and refusal paths execute in test_pencil_knife_pan_{ghost,bridge}.
PAINT_ONLY_PREFIX = PREFIX
PREFIX += ('  if (sender.state == UIGestureRecognizerStateBegan) {\n'
           '    [sender recognizeKnifePan];\n'
           '  }\n'
           '  const bool omit_knife_paired_pan = [sender omitKnifePairedPan];\n')
SIMULATED_CORRECTED_PAN = PREFIX + CORRECTED_SUFFIX
CORRECTED_PAN = PAN
def native_tokens(text):
    return re.sub(r"\s+", "", re.sub(r"/\*[\s\S]*?\*/|//[^\n]*", "", text))
assert native_tokens(PAN) == native_tokens(SIMULATED_CORRECTED_PAN), 'Actual current producer must contain the correction; never repair production source inside the test'
assert CORRECTED_PAN[:len(PREFIX)] == PREFIX
assert CORRECTED_SUFFIX.replace(NEW_MOVEMENT, OLD_MOVEMENT).replace(NEW_TERMINAL, OLD_TERMINAL) == SUFFIX

TRANSLATIONS = {
    '[sender recognizeKnifePan]': 'sender.recognizeKnifePan()',
    '[sender omitKnifePairedPan]': 'sender.omitKnifePairedPan()',
    '[sender touchStreamAllowed]': 'sender.touchStreamAllowed()',
    '[sender getScaledTouchPoint:window]': 'sender.touch_point',
    '[sender getScaledTranslation:window]': 'sender.translation',
    '[sender gestureUsesPencil]': 'sender.pencil',
    '[sender gestureUsesFinger]': '!sender.pencil',
    '[sender pencilSample]': 'sender.sample',
    '[sender pencilPaintContact]': 'sender.contact',
    '[sender ringContact]': 'sender.ring',
    '[sender hudContact]': 'sender.hud',
    '[sender setCachedTranslation:translation]': 'sender.setCachedTranslation(translation)',
    '[sender getRelativeTranslation:translation]': 'sender.getRelativeTranslation(translation)',
    '[sender setCachedTranslation:CGPointMake(0.0f, 0.0f)]': 'sender.setCachedTranslation(CGPointMake(0.0f, 0.0f))',
    '[self generateUserInputEvents:begin]': 'generateUserInputEvents(begin)',
    '[self generateUserInputEvents:pointer]': 'generateUserInputEvents(pointer)',
    '[self generateUserInputEvents:cursor_info]': 'generateUserInputEvents(cursor_info)',
    '[self generateUserInputEvents:event_info]': 'generateUserInputEvents(event_info)',
    '[self generateUserInputEvents:scroll_info]': 'generateUserInputEvents(scroll_info)',
}


def translate_pan(pan):
    result = pan.replace('- (void)handlePan:(GHOSTUIPanGestureRecognizer *)sender', 'void producer(Sender &sender)')
    for old, new in TRANSLATIONS.items():
        result = result.replace(old, new)
    assert '[sender ' not in result and '[self ' not in result
    return result


BASE = r'''
#include <algorithm>
#include <array>
#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
#define WITH_APPLE_CROSSPLATFORM
#define WIN32
NAV
#define system system_ptr
using CGFloat=double;
struct CGPoint { double x=0,y=0; };
CGPoint CGPointMake(double x,double y) { return {x,y}; }
const CGPoint CGPointZero{};
bool CGPointEqualToPoint(CGPoint a,CGPoint b) { return a.x==b.x&&a.y==b.y; }
#define GHOST_ASSERT(c,m) assert(c)
using GHOST_TEventType=int; using GHOST_TButton=int; using GHOST_SystemHandle=void*;
enum { GHOST_kEventCursorMove=1,GHOST_kEventButtonDown,GHOST_kEventButtonUp,GHOST_kEventTrackpad,
 GHOST_kEventKeyDown,GHOST_kEventKeyUp,GHOST_kKeyLeftShift,GHOST_kEventPencilToolPalette,
 GHOST_kPencilRingBegin,GHOST_kPencilRingMotion,GHOST_kPencilRingEnd,GHOST_kPencilRingCancel,
 GHOST_kButtonMaskLeft=1,GHOST_kButtonMaskRight=2,GHOST_kTrackpadEventScroll=20,
 GHOST_kTrackpadEventMagnifyTouch,GHOST_kTrackpadEventMagnify,GHOST_kTrackpadEventSmartMagnify,
 GHOST_kTrackpadEventRotate,GHOST_kTabletModeStylus };
struct GHOST_TabletData { int Active=0; float Pressure=1,Xtilt=0,Ytilt=0; };
const GHOST_TabletData GHOST_TABLET_DATA_NONE{};
struct GHOST_IWindow{};
struct GHOST_TEventCursorData { int32_t x,y; GHOST_TabletData tablet; bool is_direct_tool;
 uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger;uint64_t ipad_finger_paint_generation;
 uint64_t ipad_pencil_paint_serial,ipad_pencil_paint_generation;uintptr_t ipad_pencil_paint_region;
 int32_t ipad_pencil_paint_origin_x,ipad_pencil_paint_origin_y; };
struct GHOST_TEventButtonData { GHOST_TButton button;GHOST_TabletData tablet;bool is_cancelled,is_direct_tool;
 uint64_t ipad_hud_generation,ipad_hud_serial;bool is_direct_finger;uint64_t ipad_finger_paint_generation;
 uint64_t ipad_pencil_paint_serial,ipad_pencil_paint_generation;uintptr_t ipad_pencil_paint_region;
 int32_t ipad_pencil_paint_origin_x,ipad_pencil_paint_origin_y; };
struct GHOST_TEventTrackpadData { int subtype,x,y,deltaX,deltaY;bool isDirectionInverted;int numFingers; };
struct GHOST_Event { void *data_=nullptr;int type;GHOST_Event(uint64_t,int t,GHOST_IWindow*):type(t){}
 virtual ~GHOST_Event()=default; };
CONSTRUCTORS
// Trackpad/key storage models the ABI; actual generator arguments execute.
struct GHOST_EventTrackpad:GHOST_Event { GHOST_TEventTrackpadData d;
 GHOST_EventTrackpad(uint64_t t,GHOST_IWindow*w,int s,int x,int y,int dx,int dy,bool inv,int n):
 GHOST_Event(t,GHOST_kEventTrackpad,w),d{s,x,y,dx,dy,inv,n}{data_=&d;} };
struct GHOST_EventKey:GHOST_Event { int key;GHOST_EventKey(uint64_t t,int type,GHOST_IWindow*w,int k,bool,void*):
 GHOST_Event(t,type,w),key(k){} };
struct System { std::vector<GHOST_Event*> queue; uint64_t getMilliSeconds(){return 19;}
 void pushEvent(GHOST_Event*event){queue.push_back(event);}
 void clear(){for(auto*event:queue)delete event;queue.clear();} };
System system_owner;System*system=&system_owner;GHOST_IWindow ghost_window;GHOST_IWindow*window=&ghost_window;
uint64_t GHOST_GetMilliSeconds(void*){return 19;}
constexpr CGFloat MMB_PAN_SCALE=1;
ghost::ios::PencilPaintContact pencil_paint_enqueued;
bool pencil_paint_enqueued_down=false;uint64_t pencil_paint_retired_serial=0;
CGPoint pencil_paint_last_location,last_pencil_location;
uint64_t last_pencil_location_time=0;GHOST_TabletData pencil_paint_last_tablet,tablet_data;
USER_EVENT
TABLET_SNAPSHOT
void generateUserInputEvents(const UserInputEvent &event_info) {
 GENERATOR
}
enum { UIGestureRecognizerStateBegan=1,UIGestureRecognizerStateChanged,UIGestureRecognizerStateEnded,
 UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed };
namespace ghost::ios {
/* An unexpected native Knife probe in this brush-only boundary is a failure. */
bool pencil_knife_pan_recognize(const void *,const PencilKnifePanContact&){
 assert(false && "no original Knife actor in retained brush fixture");return false;
}
}
struct Sender {int state=UIGestureRecognizerStateBegan;bool pencil=true;
 ghost::ios::GestureContact gesture_contact;
 ghost::ios::PencilKnifePanContact pencil_knife_pan_origin;
 const void*ring_window=nullptr;bool omit_knife_paired_pan=false,knife_pan_recognized=false;
 TOUCH_FORGET_KNIFE
 TOUCH_RECOGNIZE_KNIFE
 TOUCH_OMIT_KNIFE
 CGPoint touch_point{110,100},translation{10,0},cached;
 ghost::ios::PencilSample sample{true,.4f,.2f,-.1f};ghost::ios::PencilPaintContact contact;
 ghost::ios::HUDContact hud;ghost::ios::PencilRingContact ring;
 ghost::ios::TouchAdmission touch_admission;
 Sender(){touch_admission.begin();}
 TOUCH_ALLOWED
 TOUCH_INVALIDATE
 void setCachedTranslation(CGPoint p){cached=p;}
 CGPoint getRelativeTranslation(CGPoint p){return {p.x-cached.x,p.y-cached.y};} };
ghost::ios::PointerCapture pointer_capture;ghost::ios::HUDContact pointer_hud_contact;
ghost::ios::PencilRingContact ring_capture;bool pointer_finger_contact=false;
bool mouse_left_pressed=false,mouse_middle_pressed=false,mouse_right_pressed=false,flythrough=false;
double mouse_cursor_x=0,mouse_cursor_y=0;bool GHOST_IOS_get_flythrough_mode(){return flythrough;}
std::vector<int> ring_packets;
void ios_ring_packet(System*,GHOST_IWindow*,const ghost::ios::PencilRingContact&,int phase,CGPoint){ring_packets.push_back(phase);}
Sender tap_gesture_recognizer;Sender*pan_gesture_recognizer=nullptr;
void cancelRingHover(){}
PAN
CANCEL_CAPTURE
'''

WM_BASE = r'''
enum { LEFTMOUSE=100,MIDDLEMOUSE,KM_PRESS,KM_RELEASE,KM_NOTHING,MOUSEMOVE,MOUSEPAN,MOUSEZOOM,
 MOUSESMARTZOOM,MOUSEROTATE,TIMER,OPERATOR_FINISHED=1,OPERATOR_RUNNING_MODAL=2,
 OPERATOR_CANCELLED=4,OPERATOR_PASS_THROUGH=8,WM_HANDLER_HANDLED=16,
 WM_EVENT_IS_TOUCH_PINCH=1,WM_EVENT_IS_POINTER_CANCEL=2,WM_EVENT_IS_DIRECT_TOOL=4,
 WM_EVENT_IS_DIRECT_FINGER=8,WM_EVENT_SCROLL_INVERT=16,WM_EVENT_MULTITOUCH_TWO_FINGERS=32,
 WM_EVENT_MULTITOUCH_THREE_FINGERS=64,WM_PENCIL_PAINT_PHASE_NONE=0,
 WM_PENCIL_PAINT_PHASE_PREPRESS=1,WM_PENCIL_PAINT_PHASE_BEGIN=2,
 WM_PENCIL_PAINT_PHASE_MOTION=3,WM_PENCIL_PAINT_PHASE_END=4,WM_HANDLER_TYPE_OP=1,
 WM_HANDLER_DO_FREE=2,RGN_TYPE_WINDOW=1,SPACE_VIEW3D=1,RGN_FLAG_HIDDEN=1,
 RGN_FLAG_TOO_SMALL=2,RGN_FLAG_POLL_FAILED=4,OB_MODE_SCULPT=1,OB_MODE_VERTEX_PAINT=2,
 OB_MODE_WEIGHT_PAINT=4,OB_MODE_TEXTURE_PAINT=8,OPTYPE_UNDO=1 };
using wmOperatorStatus=int;using float2=std::array<float,2>;
template<class...T>bool ELEM(int n,T...xs){return ((n==xs)||...);}
#define ISTIMER(t) ((t)==TIMER)
template<class T>struct List {std::vector<T*> items;T*first=nullptr;void add(T*x){items.push_back(x);if(!first)first=x;} };
#define LISTBASE_FOREACH(type,name,list) for(type name : (list)->items)
struct ID {uint64_t session_uid=17;};
struct ARegionRuntime {bool visible=true,ipad_canvas=true;};
struct ARegion {int regiontype=RGN_TYPE_WINDOW,flag=0;ARegionRuntime*runtime=nullptr;};
struct ScrArea {int spacetype=SPACE_VIEW3D;List<ARegion>regionbase;};
struct bScreen {ID id;List<ScrArea>areabase;};
struct wmEventHandler {int type=WM_HANDLER_TYPE_OP,flag=0;bool freed=false;};
struct Runtime {uint64_t ipad_pencil_paint_queued_serial=0,ipad_pencil_paint_queued_generation=0,
 ipad_pencil_paint_retired_serial=0,ipad_pencil_paint_cancelled_serial=0,
 ipad_pencil_paint_cancelled_generation=0;uintptr_t ipad_pencil_paint_queued_region=0;
 int32_t ipad_pencil_paint_queued_origin_xy[2]{};bool ipad_pencil_paint_queued_down=false;};
struct wmWindow {Runtime*runtime=nullptr;GHOST_IWindow*ghostwin=nullptr;List<wmEventHandler>modalhandlers;bScreen*screen=nullptr;};
struct wmWindowManager {int op_undo_depth=0;intptr_t undo_id=7,register_id=9;};
struct IPadFingerPaintOwner {std::array<uint64_t,19>values{};std::array<char,64>tool{};bool valid=true;};
struct StrokeCache {bool alt_smooth=false;};
namespace bke::pbvh {enum class Type{Mesh,BMesh};struct Tree{Type value=Type::Mesh;Type type()const{return value;}};}
struct SculptSession {StrokeCache*cache=nullptr;};
struct Brush {uint32_t flag=0;bool supports_dyntopo=false;};
constexpr uint32_t BRUSH_ANCHORED=1,BRUSH_DRAG_DOT=2;
struct Paint {Brush*brush=nullptr;};struct Sculpt {Paint paint;};struct VPaint{Paint paint;};
struct ToolSettings {Sculpt*sculpt=nullptr;VPaint*wpaint=nullptr,*vpaint=nullptr;};
constexpr int PSYS_TOT_VG=2,ID_RECALC_PSYS_RESET=1,NC_OBJECT=2,ND_DRAW=4;
struct ParticleSystem {int vgroup[PSYS_TOT_VG]{},recalc=0;};
struct Object {SculptSession*sculpt=nullptr;bke::pbvh::Tree pbvh;List<ParticleSystem>particlesystem;void*data=nullptr;};struct Depsgraph{};
int BKE_object_defgroup_active_index_get(Object*){return 1;}
void DEG_id_tag_update(ID*,int){}
void WM_event_add_notifier(const void*,int,Object*){}
struct bContext {wmWindow*win=nullptr;wmWindowManager*manager=nullptr;ScrArea*area=nullptr;
 ARegion*region=nullptr;bScreen*screen=nullptr;IPadFingerPaintOwner owner;
 bool capture_valid=true;Depsgraph*depsgraph=nullptr;Object*object=nullptr;ToolSettings*settings=nullptr;};
struct wmTabletData {int active=0;float pressure=1;std::array<float,2>tilt{};bool is_motion_absolute=false;};
struct wmEvent {int type=0,val=0,flag=0,xy[2]{},mval[2]{4,7};wmTabletData tablet;
 bool ipad_pencil_paint_down=false;uint64_t ipad_hud_generation=0,ipad_hud_serial=0,
 ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0;uintptr_t ipad_pencil_paint_region=0;
 int ipad_pencil_paint_origin_xy[2]{};uint8_t ipad_pencil_paint_phase=0;};
struct wmOperator;
struct wmOperatorType {void(*cancel)(bContext*,wmOperator*)=nullptr;void(*modal)()=nullptr;
 int flag=OPTYPE_UNDO;bool modalkeymap=false;uint64_t ipad_lifetime_id=29;};
struct wmOperator {wmOperatorType*type=nullptr;wmOperator*opm=nullptr;void*customdata=nullptr;
 uint64_t lifetime=31;bool freed=false,finished=false;};
struct wmEventHandler_Op {wmEventHandler head;bool is_fileselect=false;
 struct {wmWindow*win=nullptr;ScrArea*area=nullptr;ARegion*region=nullptr;}context;
 uint64_t ipad_pencil_paint_serial=0,ipad_pencil_paint_generation=0,
 ipad_pencil_operator_lifetime=31,ipad_pencil_type_lifetime=29,
 ipad_pencil_type_address=0,ipad_pencil_screen_uid=17;
 uintptr_t ipad_pencil_area=0,ipad_pencil_region=0;int ipad_pencil_paint_mode=0;
 int32_t ipad_pencil_origin_x=0,ipad_pencil_origin_y=0;
 uint64_t ipad_pencil_owner_values[19]{};char ipad_pencil_owner_tool[64]{};wmOperator*op=nullptr;};
int BLI_findindex(const List<wmEventHandler>*list,const wmEventHandler*h){
 auto i=std::find(list->items.begin(),list->items.end(),h);return i==list->items.end()?-1:int(i-list->items.begin());}
wmWindow*CTX_wm_window(bContext*C){return C->win;}wmWindowManager*CTX_wm_manager(bContext*C){return C->manager;}
ScrArea*CTX_wm_area(bContext*C){return C->area;}ARegion*CTX_wm_region(bContext*C){return C->region;}
bScreen*CTX_wm_screen(bContext*C){return C->screen;}
bScreen*WM_window_get_active_screen(wmWindow*w){return w->screen;}
bool ED_ipad_finger_paint_capture(bContext*C,IPadFingerPaintOwner&owner){owner=C->owner;return C->capture_valid&&owner.valid;}
bool WM_operator_touch_lifetime_matches(const wmOperator*op,uint64_t id){return op&&op->lifetime==id;}
void copy_v2_v2_int(int*a,const int*b){a[0]=b[0];a[1]=b[1];}
// Coordinate conversion and tablet preference transform are explicit ABI boundaries.
void wm_cursor_position_from_ghost_screen_coords(wmWindow*,int*x,int*y){*x+=3;*y=900-*y;}
void wm_stereo3d_mouse_offset_apply(wmWindow*,int*xy){xy[0]+=2;}
void wm_tablet_data_from_ghost(const GHOST_TabletData*d,wmTabletData*out){
 out->active=d->Active;out->pressure=d->Pressure;out->tilt={d->Xtilt,d->Ytilt};out->is_motion_absolute=d->Active!=0;}
int wm_event_type_from_ghost_button(int,int){return LEFTMOUSE;}
int shared_state_updates=0;std::vector<wmEvent>wm_queue;
void queue_native(wmWindow*win,GHOST_Event*packet){
 const int type=packet->type;const void*customdata=packet->data_;
 bool ipad_pencil_tagged=false;ghost::ios::PencilPaintContact ipad_pencil_contact{};
 bool ipad_pencil_dispatch_down=false;uint8_t ipad_pencil_dispatch_phase=WM_PENCIL_PAINT_PHASE_NONE;
 QUEUE_ADMISSION
 wmEvent event,event_state_value;wmEvent*event_state=&event_state_value;
 if(type==GHOST_kEventCursorMove){
  const auto*cd=static_cast<const GHOST_TEventCursorData*>(customdata);
  CURSOR_CONVERT
  ++shared_state_updates;
 }else if(ELEM(type,GHOST_kEventButtonDown,GHOST_kEventButtonUp)){
  const auto*bd=static_cast<const GHOST_TEventButtonData*>(customdata);
  BUTTON_CONVERT
  wm_tablet_data_from_ghost(&bd->tablet,&event.tablet);++shared_state_updates;
 }else if(type==GHOST_kEventTrackpad){
  const auto*pd=static_cast<const GHOST_TEventTrackpadData*>(customdata);
  TRACKPAD_CONVERT
  (void)delta;
 }else return;
 (void)ipad_pencil_tagged;wm_queue.push_back(event);
}
struct VPaintData {struct {Object*obact=nullptr;}vc;};
struct PaintStroke {int event_type=LEFTMOUSE;void*mode_data=nullptr;};
void*paint_stroke_mode_data(PaintStroke*stroke){return stroke->mode_data;}
int line_finalizers=0,done_calls=0,cache_frees=0,undo_restores=0,texture_exits=0,
 modal_releases=0,cancel_calls=0,reports=0,operator_frees=0,handler_frees=0,finished_calls=0;
std::vector<int>native_order;
namespace vertex {static void vpaint_stroke_done(const bContext*,PaintStroke*);}
namespace weight {static void wpaint_stroke_done(const bContext*,PaintStroke*);}
void stroke_done(bContext*C,wmOperator*op,PaintStroke*stroke){++done_calls;native_order.push_back(30);
 if(C->owner.values[9]==OB_MODE_VERTEX_PAINT)vertex::vpaint_stroke_done(C,stroke);
 if(C->owner.values[9]==OB_MODE_WEIGHT_PAINT)weight::wpaint_stroke_done(C,stroke);
 op->customdata=nullptr;}
void paint_stroke_line_constrain(PaintStroke*,float2&){}
void paint_stroke_line_end(bContext*,wmOperator*,PaintStroke*,float2){++line_finalizers;native_order.push_back(10);}
Depsgraph*CTX_data_depsgraph_pointer(const bContext*C){return C->depsgraph;}
Object*CTX_data_active_object(const bContext*C){return C->object;}
ToolSettings*CTX_data_tool_settings(const bContext*C){return C->settings;}
Brush*BKE_paint_brush_for_read(Paint*p){return p->brush;}
namespace bke::object {const bke::pbvh::Tree*pbvh_get(const Object&o){return &o.pbvh;}}
namespace bke::brush {bool supports_dyntopo(const Brush&b){return b.supports_dyntopo;}}
namespace blender::ed::sculpt_paint::undo {void restore_from_undo_step(const Depsgraph&,Sculpt&,Object&){++undo_restores;native_order.push_back(5);}}
void MEM_delete(StrokeCache*p){if(p){++cache_frees;native_order.push_back(20);delete p;}}
void brush_exit_tex(Sculpt&){++texture_exits;native_order.push_back(40);}
namespace vwpaint {void smooth_brush_toggle_off(Paint*,StrokeCache*cache){assert(cache);native_order.push_back(25);}}
GENERIC_CANCEL
namespace blender::ed::sculpt_paint::dyntopo {DYNTOPO}
namespace blender::ed::sculpt_paint {SCULPT_CANCEL}
namespace vertex {VERTEX_DONE
VERTEX_CANCEL}
namespace weight {WEIGHT_DONE
WEIGHT_CANCEL}
namespace texture {TEXTURE_CANCEL}
void native_modal_marker(){}
std::array<wmOperatorType,4>registered_types;
OPERATOR_ID
wmOperatorType*WM_operatortype_find(const char*name,bool){
 const std::array<const char*,4>names{"SCULPT_OT_brush_stroke","PAINT_OT_vertex_paint","PAINT_OT_weight_paint","PAINT_OT_image_paint"};
 for(size_t i=0;i<names.size();++i)if(name&&std::strcmp(names[i],name)==0)return &registered_types[i];return nullptr;}
REGISTERED
OWNER_MATCH
enum class eIPadPencilPaintModalEvent:uint8_t{OwnedContact,StaleContact,Timer,Interrupt};
enum class eIPadPencilPaintModalAdmission:uint8_t{Dispatch,Consume,Cancel};
EVENT_MATCH
CLASSIFY
ADMIT
CANCELLED_MARK
CANCELLED_CONSUME
wmOperatorStatus native_release(bContext*C,wmOperator*op,const wmEvent*event,PaintStroke**stroke_p){
 auto*stroke=*stroke_p;bool first_modal=false;NATIVE_RELEASE return OPERATOR_RUNNING_MODAL;}
void wm_operator_reports(bContext*,wmOperator*,int,bool){++reports;native_order.push_back(50);}
void WM_window_status_area_tag_redraw(wmWindow*){}
intptr_t wm_operator_undo_active_id(wmWindowManager*wm){return wm->undo_id;}
intptr_t wm_operator_register_active_id(wmWindowManager*wm){return wm->register_id;}
// The native finished body owns registration/history/possible free. Model only
// the call boundary; this fixture makes no claim about its storage/history effects.
void wm_operator_finished(bContext*C,wmOperator*op,bool repeat,bool store,
                          bool has_undo_step,bool has_register){
 assert(C->manager->op_undo_depth==0&&!op->freed&&!op->finished&&!op->customdata);
 assert(!repeat&&store&&!has_undo_step&&!has_register);
 op->finished=true;++finished_calls;native_order.push_back(55);
}
void WM_operator_free(wmOperator*op){assert(!op->freed);op->freed=true;++operator_frees;native_order.push_back(60);}
void WM_cursor_grab_disable(wmWindow*,void*){}
void BLI_remlink(List<wmEventHandler>*list,void*item){auto*h=static_cast<wmEventHandler*>(item);
 auto i=std::find(list->items.begin(),list->items.end(),h);assert(i!=list->items.end());list->items.erase(i);native_order.push_back(70);}
void wm_event_free_handler(wmEventHandler*h){h->freed=true;++handler_frees;native_order.push_back(80);}
int consume_native(bContext*C,wmWindow*win,wmEventHandler_Op*handler,wmEvent*event){
 if(wm_ipad_pencil_paint_cancelled_contact_consume(win,event))return WM_HANDLER_HANDLED;
 const auto admission=wm_ipad_pencil_paint_modal_admit(C,win,event,handler);
 if(admission==eIPadPencilPaintModalAdmission::Consume)return WM_HANDLER_HANDLED;
 wmOperator*op=handler->op;wmOperatorType*ot=op->type;wmWindowManager*wm=CTX_wm_manager(C);
 auto*handlers=&win->modalhandlers;bool ipad_pencil_paint_interrupt=false;
 INTERRUPT_DECISION
 int retval=OPERATOR_RUNNING_MODAL;
 const intptr_t undo_id_prev=wm_operator_undo_active_id(wm);
 const intptr_t register_id_prev=wm_operator_register_active_id(wm);
 UNDO_BEGIN
 NATIVE_INTERRUPT
 if(!ipad_pencil_paint_interrupt){
  if(event->type==LEFTMOUSE&&event->val==KM_RELEASE){++modal_releases;auto*stroke=static_cast<PaintStroke*>(op->customdata);
   retval=native_release(C,op,event,&stroke);op->customdata=stroke;}
 }
 else ++cancel_calls;
 UNDO_END
 CANCEL_REPORTS
 OPERATOR_FINISHED_BRANCH
 OPERATOR_RELEASE
 HANDLER_REMOVE
 return retval;
}
'''

SCENARIOS = r'''
struct Fixture {
 Runtime runtime;wmWindowManager manager;ARegionRuntime rr;ARegion region{RGN_TYPE_WINDOW,0,&rr};
 ScrArea area;bScreen screen;wmWindow win{&runtime,&ghost_window};bContext C;
 SculptSession session;Object object{&session};Depsgraph depsgraph;Brush brush;Sculpt sculpt{{&brush}};
 ToolSettings settings{&sculpt};VPaint vpaint,wpaint;VPaintData vpaint_data;PaintStroke stroke;wmOperator op;wmEventHandler_Op owner;
 Sender sender;int mode;
 Fixture(int selected=OB_MODE_SCULPT):mode(selected){
  system_owner.clear();wm_queue.clear();ring_packets.clear();native_order.clear();pan_gesture_recognizer=&sender;
  pencil_paint_enqueued={};pencil_paint_enqueued_down=false;pencil_paint_retired_serial=0;
  pointer_capture={};pointer_hud_contact={};ring_capture={};pointer_finger_contact=false;
  mouse_left_pressed=mouse_middle_pressed=mouse_right_pressed=flythrough=false;
  line_finalizers=done_calls=cache_frees=undo_restores=texture_exits=modal_releases=cancel_calls=0;
  reports=operator_frees=handler_frees=shared_state_updates=finished_calls=0;
  ghost::ios::navigation_regions.clear();ghost::ios::finger_paint_regions.clear();
  ghost::ios::pencil_ring_presentations.clear();
  registered_types={};registered_types[0].cancel=blender::ed::sculpt_paint::sculpt_brush_stroke_cancel;
  registered_types[1].cancel=vertex::vpaint_cancel;registered_types[2].cancel=weight::wpaint_cancel;
  registered_types[3].cancel=texture::paint_cancel;
  for(auto&t:registered_types)t.modal=native_modal_marker;
  area.regionbase.add(&region);screen.areabase.add(&area);win.screen=&screen;
  C.win=&win;C.manager=&manager;C.area=&area;C.region=&region;C.screen=&screen;
  C.object=&object;C.depsgraph=&depsgraph;C.settings=&settings;
  settings.vpaint=&vpaint;settings.wpaint=&wpaint;vpaint_data.vc.obact=&object;stroke.mode_data=&vpaint_data;
  C.owner.values[9]=mode;std::strcpy(C.owner.tool.data(),"builtin_brush.Draw");
  auto index=mode==OB_MODE_SCULPT?0:mode==OB_MODE_VERTEX_PAINT?1:mode==OB_MODE_WEIGHT_PAINT?2:3;
  op.type=&registered_types[index];op.customdata=&stroke;session.cache=new StrokeCache;
  present(71);sender.contact=ghost::ios::pencil_paint_at_start(window,100,100,41);
  assert(sender.contact.valid());owner.op=&op;owner.context.area=&area;owner.context.region=&region;
  owner.ipad_pencil_type_address=uintptr_t(op.type);owner.ipad_pencil_area=uintptr_t(&area);
  owner.ipad_pencil_region=uintptr_t(&region);owner.ipad_pencil_paint_mode=mode;
  for(int i=0;i<19;++i)owner.ipad_pencil_owner_values[i]=C.owner.values[i];
  std::strcpy(owner.ipad_pencil_owner_tool,C.owner.tool.data());win.modalhandlers.add(&owner.head);
 }
 ~Fixture(){system_owner.clear();if(session.cache)delete session.cache;}
 void present(uint64_t generation){ghost::ios::set_finger_paint_regions(window,{{{0,0,700,700},generation,uintptr_t(&region)}});}
 void expire(){ghost::ios::set_finger_paint_regions(window,{});}
 void action(int state,CGPoint point={114,102},CGPoint translation={14,2}){
  sender.state=state;sender.touch_point=point;sender.translation=translation;producer(sender);}
 void transfer(){for(auto*packet:system_owner.queue)queue_native(&win,packet);system_owner.clear();}
 void bind(){
  // Initial native modal admission/brush allocation is the explicit setup boundary.
  // Queue receipt, tuple/lifetime/context registration and subsequent policy are real.
  assert(wm_queue.size()==2);const auto&begin=wm_queue.back();
  assert(begin.type==LEFTMOUSE&&begin.val==KM_PRESS&&begin.ipad_pencil_paint_down);
  assert(begin.ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_BEGIN);
  owner.ipad_pencil_paint_serial=begin.ipad_pencil_paint_serial;
  owner.ipad_pencil_paint_generation=begin.ipad_pencil_paint_generation;
  owner.ipad_pencil_origin_x=begin.ipad_pencil_paint_origin_xy[0];
  owner.ipad_pencil_origin_y=begin.ipad_pencil_paint_origin_xy[1];
  assert(wm_ipad_pencil_paint_handler_registered(&win,&owner));
  assert(wm_ipad_pencil_paint_modal_owner_matches(&C,&win,&owner,false));
  wm_queue.clear();
 }
 void begin(){action(UIGestureRecognizerStateBegan,{110,100},{10,0});
  assert(system_owner.queue.size()==2&&pencil_paint_enqueued_down);transfer();bind();}
 void dispatch(){for(auto&event:wm_queue)consume_native(&C,&win,&owner,&event);wm_queue.clear();}
 void check_packet(GHOST_Event*packet,bool cancel=false){
  if(packet->type==GHOST_kEventCursorMove){auto*d=static_cast<GHOST_TEventCursorData*>(packet->data_);
   assert(d->ipad_pencil_paint_serial==sender.contact.serial&&d->ipad_pencil_paint_generation==sender.contact.generation);
   assert(d->ipad_pencil_paint_region==sender.contact.region&&d->ipad_pencil_paint_origin_x==100&&d->ipad_pencil_paint_origin_y==100);
   assert(d->tablet.Active==GHOST_kTabletModeStylus&&d->tablet.Pressure==sender.sample.pressure&&d->tablet.Xtilt==sender.sample.xtilt);
  }else{auto*d=static_cast<GHOST_TEventButtonData*>(packet->data_);assert(d->is_cancelled==cancel);
   assert(d->ipad_pencil_paint_serial==sender.contact.serial&&d->ipad_pencil_paint_generation==sender.contact.generation);
   assert(d->ipad_pencil_paint_region==sender.contact.region&&d->ipad_pencil_paint_origin_x==100&&d->ipad_pencil_paint_origin_y==100);
   assert(d->tablet.Pressure==sender.sample.pressure&&d->tablet.Ytilt==sender.sample.ytilt);}
 }
 void check_cleanup(){assert(reports==1&&operator_frees==1&&handler_frees==1&&op.freed&&owner.head.freed&&finished_calls==0&&!op.finished);
  assert(owner.op==nullptr&&win.modalhandlers.items.empty()&&manager.op_undo_depth==0);
  assert(native_order.size()>=4);auto end=native_order.end();assert(std::vector<int>(end-4,end)==std::vector<int>({50,60,70,80}));}
 void check_finished(){assert(reports==1&&finished_calls==1&&operator_frees==0&&!op.freed&&op.finished&&handler_frees==1&&owner.head.freed);
  assert(owner.op==nullptr&&win.modalhandlers.items.empty()&&manager.op_undo_depth==0);
  assert(native_order.size()>=4);auto end=native_order.end();assert(std::vector<int>(end-4,end)==std::vector<int>({50,55,70,80}));}
};

void movement(){Fixture f;f.begin();
 for(auto translation:{CGPoint{14,2},CGPoint{14,2},CGPoint{21,-3}}){
  f.sender.sample={true,translation.x==14?.2f:0.f,.3f,-.4f};
  f.action(UIGestureRecognizerStateChanged,{100+translation.x,100+translation.y},translation);
  assert(system_owner.queue.size()==1&&system_owner.queue[0]->type==GHOST_kEventCursorMove);
  f.check_packet(system_owner.queue[0]);assert(f.sender.cached.x==translation.x&&f.sender.cached.y==translation.y);
  f.transfer();assert(wm_queue.size()==1&&wm_queue[0].type==MOUSEMOVE);
  assert(wm_queue[0].ipad_pencil_paint_down&&wm_queue[0].ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_MOTION);
  assert(wm_queue[0].ipad_pencil_paint_origin_xy[0]==105&&wm_queue[0].ipad_pencil_paint_origin_xy[1]==800);
  f.dispatch();assert(!cancel_calls&&!done_calls&&!line_finalizers&&!modal_releases);}
 f.action(UIGestureRecognizerStateEnded);assert(system_owner.queue.size()==1);f.check_packet(system_owner.queue[0]);
 f.transfer();f.dispatch();assert(modal_releases==1&&line_finalizers==1&&done_calls==1&&!cancel_calls);f.check_finished();}

void terminal(int state,int mode,bool expired,bool dyntopo=false){Fixture f(mode);f.begin();
 if(expired)f.expire();if(dyntopo){f.object.pbvh.value=bke::pbvh::Type::BMesh;f.brush.supports_dyntopo=true;}
 if(mode==OB_MODE_VERTEX_PAINT||mode==OB_MODE_WEIGHT_PAINT)f.session.cache->alt_smooth=true;
 f.action(state);assert(system_owner.queue.size()==1&&system_owner.queue[0]->type==GHOST_kEventButtonUp);
 bool cancelled=state!=UIGestureRecognizerStateEnded;f.check_packet(system_owner.queue[0],cancelled);
 assert(!pencil_paint_enqueued_down&&pencil_paint_retired_serial==41);
 f.transfer();assert(wm_queue.size()==1&&wm_queue[0].ipad_pencil_paint_phase==WM_PENCIL_PAINT_PHASE_END);
 assert(bool(wm_queue[0].flag&WM_EVENT_IS_POINTER_CANCEL)==cancelled);f.dispatch();
 if(cancelled)f.check_cleanup();else f.check_finished();
 if(cancelled){assert(cancel_calls==1&&!modal_releases&&!line_finalizers&&done_calls==1);
  if(mode==OB_MODE_SCULPT){assert(undo_restores==!dyntopo&&cache_frees==1&&texture_exits==1);
   assert(native_order[dyntopo?0:1]==30&&native_order[dyntopo?1:2]==20&&native_order[dyntopo?2:3]==40);}
  else if(mode==OB_MODE_VERTEX_PAINT||mode==OB_MODE_WEIGHT_PAINT){assert(cache_frees==1&&native_order[0]==30&&native_order[1]==25&&native_order[2]==20);}
  else assert(cache_frees==0&&native_order[0]==30);
 }else assert(!cancel_calls&&modal_releases==1&&line_finalizers==1&&done_calls==1);
 f.action(state);f.action(UIGestureRecognizerStateChanged,{125,101},{25,1});assert(system_owner.queue.empty());}

void expiry(){for(int state:{UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
 Fixture f;f.begin();f.expire();f.action(UIGestureRecognizerStateChanged);assert(system_owner.queue.size()==1);
 f.transfer();f.dispatch();assert(!cancel_calls);f.action(state);assert(system_owner.queue.size()==1);f.transfer();f.dispatch();assert(done_calls==1);}
 for(int state:{UIGestureRecognizerStateEnded,UIGestureRecognizerStateCancelled,UIGestureRecognizerStateFailed}){
 Fixture f;f.expire();f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.empty()&&!pencil_paint_enqueued_down);
 f.action(UIGestureRecognizerStateChanged);f.action(state);assert(system_owner.queue.empty());
 assert(!shared_state_updates&&!cancel_calls&&!done_calls);}
 {Fixture f;f.action(UIGestureRecognizerStateFailed);assert(system_owner.queue.empty());}}

void expiry_between_native_enqueues(){Fixture f;
 f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.size()==2);
 queue_native(&f.win,system_owner.queue[0]);assert(wm_queue.size()==1);
 f.expire();queue_native(&f.win,system_owner.queue[1]);system_owner.clear();
 assert(wm_queue.size()==1&&!f.runtime.ipad_pencil_paint_queued_down&&f.runtime.ipad_pencil_paint_retired_serial==41);
 wm_queue.clear();f.action(UIGestureRecognizerStateCancelled);f.transfer();assert(wm_queue.empty());
 assert(!cancel_calls&&!modal_releases&&!done_calls);}

void tuple_mismatch(){for(int field=0;field<5;++field){Fixture f;f.begin();auto original=f.sender.contact;
 switch(field){case 0:++f.sender.contact.serial;break;case 1:++f.sender.contact.generation;break;
 case 2:++f.sender.contact.region;break;case 3:++f.sender.contact.origin_x;break;case 4:++f.sender.contact.origin_y;break;}
 f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateCancelled);assert(system_owner.queue.empty());
 assert(pencil_paint_enqueued_down&&ghost::ios::pencil_paint_contact_equal(pencil_paint_enqueued,original));
 assert(f.runtime.ipad_pencil_paint_queued_down&&!cancel_calls);
 f.sender.contact=original;f.action(UIGestureRecognizerStateEnded);f.transfer();f.dispatch();assert(done_calls==1&&!cancel_calls);}}

void replacement(){Fixture f;f.begin();auto old=f.sender.contact;
 f.action(UIGestureRecognizerStateCancelled);f.transfer();f.dispatch();assert(cancel_calls==1);
 // New generator lease; a separate native initial admission is not needed to
 // prove old producer packets cannot enter this replacement queue lease.
 f.present(72);f.sender.contact=ghost::ios::pencil_paint_at_start(window,100,100,42);
 f.action(UIGestureRecognizerStateBegan,{110,100},{10,0});f.transfer();assert(f.runtime.ipad_pencil_paint_queued_serial==42);
 f.owner.head.freed=false;f.owner.head.flag=0;f.op.freed=false;f.op.customdata=&f.stroke;
 ++f.op.lifetime;f.owner.ipad_pencil_operator_lifetime=f.op.lifetime;f.owner.op=&f.op;
 f.session.cache=new StrokeCache;f.win.modalhandlers.add(&f.owner.head);f.bind();
 auto replacement_contact=f.sender.contact;f.sender.contact=old;
 f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateEnded);f.action(UIGestureRecognizerStateFailed);
 assert(system_owner.queue.empty()&&pencil_paint_enqueued.serial==42&&pencil_paint_enqueued_down);
 assert(f.runtime.ipad_pencil_paint_queued_serial==42&&f.runtime.ipad_pencil_paint_queued_down&&cancel_calls==1);
 f.sender.contact=replacement_contact;f.action(UIGestureRecognizerStateEnded);f.transfer();assert(wm_queue.size()==1);
 f.dispatch();assert(cancel_calls==1&&modal_releases==1&&line_finalizers==1&&done_calls==2&&operator_frees==1&&finished_calls==1&&handler_frees==2);}

void capture_cancel(){Fixture f;f.begin();f.action(UIGestureRecognizerStateChanged,{123,104},{23,4});
 f.transfer();f.dispatch();auto sample=f.sender.sample;f.expire();tablet_data.Pressure=.99f;
 cancel_capture();assert(system_owner.queue.size()==1);f.check_packet(system_owner.queue[0],true);
 assert(!f.sender.touchStreamAllowed());
 f.transfer();f.dispatch();assert(cancel_calls==1&&!modal_releases&&!line_finalizers&&done_calls==1);f.check_cleanup();
 assert(pencil_paint_last_location.x==123&&pencil_paint_last_tablet.Pressure==sample.pressure);
 cancel_capture();f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateCancelled);f.action(UIGestureRecognizerStateEnded);
 assert(system_owner.queue.empty()&&cancel_calls==1);}

void owner_guards(){for(int mutation=0;mutation<10;++mutation){Fixture f;f.begin();f.action(UIGestureRecognizerStateCancelled);f.transfer();
 switch(mutation){case 0:f.win.modalhandlers.items.clear();break;case 1:++f.op.lifetime;break;
 case 2:++f.op.type->ipad_lifetime_id;break;case 3:f.owner.head.flag=WM_HANDLER_DO_FREE;break;
 case 4:f.C.owner.values[17]++;break;case 5:f.C.owner.values[9]=99;break;
 case 6:f.C.owner.tool[0]='X';break;case 7:f.rr.visible=false;break;
 case 8:f.region.runtime=nullptr;break;case 9:++f.screen.id.session_uid;break;}
 f.dispatch();assert(!cancel_calls&&!modal_releases&&!done_calls&&!operator_frees);}}

void untagged_and_finger(){for(bool pencil:{false,true})for(bool fly:{false,true}){
 Fixture f;f.sender.contact={};f.sender.pencil=pencil;flythrough=fly;
 f.action(UIGestureRecognizerStateBegan,{110,100},{10,0});assert(system_owner.queue.size()==(pencil?2:1));system_owner.clear();
 f.action(UIGestureRecognizerStateChanged,{115,103},{15,3});assert(system_owner.queue.size()==(pencil?2:1));
 auto*pan=system_owner.queue[0];assert(pan->type==GHOST_kEventTrackpad);
 auto*d=static_cast<GHOST_TEventTrackpadData*>(pan->data_);assert(d->subtype==GHOST_kTrackpadEventScroll);
 assert(d->numFingers==(!pencil&&fly?2:1)&&d->isDirectionInverted==(!pencil&&fly));
 assert(d->deltaX==5&&d->deltaY==3);assert(d->x==(!pencil&&!fly?100:115));
 if(pencil){auto*cursor=static_cast<GHOST_TEventCursorData*>(system_owner.queue[1]->data_);assert(cursor->tablet.Pressure==.4f&&!cursor->ipad_pencil_paint_serial);}
 system_owner.clear();f.action(UIGestureRecognizerStateCancelled);assert(system_owner.queue.size()==1);
 if(pencil)assert(!static_cast<GHOST_TEventButtonData*>(system_owner.queue[0]->data_)->is_cancelled);
 else assert(system_owner.queue[0]->type==GHOST_kEventCursorMove);
 }}

void native_navigation(){Fixture f;f.begin();CGPoint point{50,60},delta{5,-2};CGFloat distance=7;
 for(auto kind:{UserInputEvent::PAN_GESTURE,UserInputEvent::PAN_GESTURE_TWO_FINGERS,
                UserInputEvent::PAN_GESTURE_THREE_FINGERS,UserInputEvent::PINCH_GESTURE}){
  for(bool direct:{false,true}){UserInputEvent evt(&point,&delta,&distance,false);evt.direct_touch=direct;evt.add_event(kind);
   generateUserInputEvents(evt);assert(!system_owner.queue.empty());
   auto*pan=system_owner.queue[kind==UserInputEvent::PAN_GESTURE_THREE_FINGERS?1:0];assert(pan->type==GHOST_kEventTrackpad);
   auto*d=static_cast<GHOST_TEventTrackpadData*>(pan->data_);
   assert(d->subtype==(kind==UserInputEvent::PINCH_GESTURE?(direct?GHOST_kTrackpadEventMagnifyTouch:GHOST_kTrackpadEventMagnify):GHOST_kTrackpadEventScroll));
   if(kind==UserInputEvent::PAN_GESTURE_THREE_FINGERS){assert(system_owner.queue.size()==3);
    assert(system_owner.queue[0]->type==GHOST_kEventKeyDown&&system_owner.queue[2]->type==GHOST_kEventKeyUp);}
   f.transfer();assert(wm_queue.size()==1&&!wm_queue[0].ipad_pencil_paint_serial);
   auto admission=wm_ipad_pencil_paint_modal_admit(&f.C,&f.win,&wm_queue[0],&f.owner);
   assert(admission==eIPadPencilPaintModalAdmission::Cancel);
   if(kind==UserInputEvent::PINCH_GESTURE)assert(bool(wm_queue[0].flag&WM_EVENT_IS_TOUCH_PINCH)==direct);
   wm_queue.clear();}}
 // One independent hardware/navigation packet retains the real interrupt path.
 wmEvent hardware;hardware.type=MOUSEPAN;consume_native(&f.C,&f.win,&f.owner,&hardware);
 assert(cancel_calls==1&&!modal_releases&&!line_finalizers);f.check_cleanup();}

void early_routes(){
 {Fixture f;f.sender.invalidateTouchStream();f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.empty());}
 for(int button=0;button<3;++button){Fixture f;mouse_left_pressed=button==0;mouse_middle_pressed=button==1;mouse_right_pressed=button==2;
  f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.empty()&&pointer_capture.ended);}
 {Fixture f;f.sender.ring.captured=true;f.sender.ring.origin_x=100;f.sender.ring.origin_y=100;
  f.action(UIGestureRecognizerStateBegan);f.action(UIGestureRecognizerStateChanged);f.action(UIGestureRecognizerStateCancelled);
  assert(system_owner.queue.empty()&&ring_packets==std::vector<int>({GHOST_kPencilRingBegin,GHOST_kPencilRingMotion,GHOST_kPencilRingMotion,GHOST_kPencilRingCancel}));}
 for(bool tool:{false,true}){Fixture f;
  ghost::ios::NavigationRect rect{0,0,700,700};rect.kind=tool?ghost::ios::PointerCaptureKind::ToolManipulation:ghost::ios::PointerCaptureKind::Navigation;
  ghost::ios::set_navigation_regions(window,{rect});f.sender.contact={};
  if(!tool)f.sender.hud={8,9,100,100};
  f.action(UIGestureRecognizerStateBegan);assert(system_owner.queue.size()==3);system_owner.clear();
  f.action(UIGestureRecognizerStateChanged);assert(system_owner.queue.size()==1&&system_owner.queue[0]->type==GHOST_kEventCursorMove);system_owner.clear();
  f.action(UIGestureRecognizerStateCancelled);assert(system_owner.queue.size()==2);
  auto*d=static_cast<GHOST_TEventButtonData*>(system_owner.queue.back()->data_);assert(d->is_cancelled&&d->is_direct_tool==tool);
  if(!tool)assert(d->ipad_hud_generation==8&&d->ipad_hud_serial==9);
 }}

int main(int argc,char**argv){assert(argc>=2);std::string name=argv[1];
 if(name=="movement")movement();else if(name=="expiry")expiry();else if(name=="mid_enqueue_expiry")expiry_between_native_enqueues();
 else if(name=="tuple")tuple_mismatch();else if(name=="replacement")replacement();else if(name=="capture")capture_cancel();
 else if(name=="owner")owner_guards();else if(name=="untagged")untagged_and_finger();
 else if(name=="navigation")native_navigation();else if(name=="early")early_routes();
 else if(name=="terminal"){assert(argc==6);terminal(std::stoi(argv[2]),std::stoi(argv[3]),std::stoi(argv[4]),std::stoi(argv[5]));}
 else assert(false);std::cout<<"PASS "<<name<<"\n";system_owner.clear();}
'''


def build_source(pan):
    enqueue = function(IOS, '- (void)generateUserInputEvents:')
    generator = enqueue[enqueue.index('    const GHOST_TabletData event_tablet ='):enqueue.rfind('  }\n}')]
    generator = re.sub(r'      IOS_INPUT_LOG\([\s\S]*?\);\n', '', generator).replace('FALSE', 'false')
    ghost_event = function(WM, 'void wm_event_add_ghostevent(')
    queue = between(ghost_event, '  /* Consume the whole proven Finger canvas group', '  /**\n   * Having both,')
    cursor = between(WM, '      copy_v2_v2_int(event.xy, &cd->x);', '      {\n        wmEvent *event_new')
    button = between(WM, '      /* Get value and type from GHOST.', '      /* Get tablet data. */')
    trackpad = between(WM, '      int delta[2] = {pd->deltaX, -pd->deltaY};', '      wm_event_add_trackpad(win, &event, delta[0], delta[1]);')
    modal = function(source(SOURCE_PATHS[-1]), 'wmOperatorStatus paint_stroke_modal(')
    release = between(modal, '  float2 mouse;\n  if (event->type == stroke->event_type && !first_modal)',
                      '  else if (ELEM(event->type, EVT_RETKEY, EVT_SPACEKEY))')
    op_call = function(WM, 'static eHandlerActionFlag wm_handler_operator_call(')
    interrupt_start = op_call.index('ipad_pencil_paint_interrupt =', op_call.index('Cancel while the frozen owner'))
    interrupt = op_call[interrupt_start:op_call.index(';', interrupt_start) + 1]
    capture = function(IOS, '- (void)cancelPointerCapture').replace('- (void)cancelPointerCapture', 'void cancel_capture()')
    capture = capture.replace('[self generateUserInputEvents:release]', 'generateUserInputEvents(release)')
    capture = capture.replace('[self cancelRingHover]', 'cancelRingHover()')
    capture = capture.replace('[tap_gesture_recognizer invalidateTouchStream]', 'tap_gesture_recognizer.invalidateTouchStream()')
    capture = capture.replace('[pan_gesture_recognizer invalidateTouchStream]', 'pan_gesture_recognizer->invalidateTouchStream()')
    recognizer = IOS.split('@implementation GHOSTUIPanGestureRecognizer', 1)[1].split('@end', 1)[0]
    constructors = []
    for name in ('GHOST_EventCursor', 'GHOST_EventButton'):
        text = source('intern/ghost/intern/' + name + '.hh')
        constructors.append(text[text.index('class ' + name + ' :'):])
    sculpt = source(SOURCE_PATHS[5])
    values = {
        'NAV': NAV.replace('#pragma once', ''),
        'CONSTRUCTORS': '\n'.join(constructors),
        'USER_EVENT': between(IOS, 'typedef struct UserInputEvent {', '  NSString *getEventTypeDesc') + '} UserInputEvent;\n',
        'TABLET_SNAPSHOT': function(IOS, 'static GHOST_TabletData ios_tablet_snapshot('),
        'GENERATOR': generator,
        'PAN': translate_pan(pan),
        'CANCEL_CAPTURE': capture,
        'TOUCH_ALLOWED': function(recognizer, '- (BOOL)touchStreamAllowed').replace('- (BOOL)touchStreamAllowed', 'bool touchStreamAllowed()'),
        'TOUCH_INVALIDATE': function(recognizer, '- (void)invalidateTouchStream').replace('- (void)invalidateTouchStream', 'void invalidateTouchStream()').replace('[self forgetKnifePanContact]', 'forgetKnifePanContact()'),
        'TOUCH_FORGET_KNIFE': function(recognizer, '- (void)forgetKnifePanContact').replace('- (void)forgetKnifePanContact', 'void forgetKnifePanContact()'),
        'TOUCH_RECOGNIZE_KNIFE': function(recognizer, '- (void)recognizeKnifePan').replace('- (void)recognizeKnifePan', 'void recognizeKnifePan()'),
        'TOUCH_OMIT_KNIFE': block(recognizer, '- (BOOL)omitKnifePairedPan').replace('- (BOOL)omitKnifePairedPan', 'bool omitKnifePairedPan()'),
        'QUEUE_ADMISSION': queue,
        'CURSOR_CONVERT': cursor,
        'BUTTON_CONVERT': button,
        'TRACKPAD_CONVERT': trackpad,
        'GENERIC_CANCEL': function(source(SOURCE_PATHS[-1]), 'void paint_stroke_cancel('),
        'DYNTOPO': function(sculpt, 'bool stroke_is_dyntopo('),
        'SCULPT_CANCEL': function(sculpt, 'static void sculpt_brush_stroke_cancel('),
        'VERTEX_CANCEL': function(source(SOURCE_PATHS[6]), 'static void vpaint_cancel('),
        'VERTEX_DONE': function(source(SOURCE_PATHS[6]), 'static void vpaint_stroke_done('),
        'WEIGHT_CANCEL': function(source(SOURCE_PATHS[7]), 'static void wpaint_cancel('),
        'WEIGHT_DONE': function(source(SOURCE_PATHS[7]), 'static void wpaint_stroke_done('),
        'TEXTURE_CANCEL': function(source(SOURCE_PATHS[8]), 'static void paint_cancel('),
        'OPERATOR_ID': function(WM, 'static const char *wm_ipad_pencil_paint_operator_id('),
        'REGISTERED': function(WM, 'static bool wm_ipad_pencil_paint_handler_registered('),
        'OWNER_MATCH': function(WM, 'static bool wm_ipad_pencil_paint_modal_owner_matches('),
        'EVENT_MATCH': function(WM, 'static bool wm_ipad_pencil_paint_event_matches_handler('),
        'CLASSIFY': function(WM, 'static eIPadPencilPaintModalEvent wm_ipad_pencil_paint_modal_event_classify('),
        'ADMIT': function(WM, 'static eIPadPencilPaintModalAdmission wm_ipad_pencil_paint_modal_admit('),
        'CANCELLED_MARK': function(WM, 'static void wm_ipad_pencil_paint_cancelled_contact_mark('),
        'CANCELLED_CONSUME': function(WM, 'static bool wm_ipad_pencil_paint_cancelled_contact_consume('),
        'NATIVE_RELEASE': release,
        'INTERRUPT_DECISION': interrupt,
        'UNDO_BEGIN': block(op_call, 'if (ot->flag & OPTYPE_UNDO) {'),
        'NATIVE_INTERRUPT': block(op_call, 'if (ipad_pencil_paint_interrupt) {'),
        'UNDO_END': block(op_call, 'if (ot->flag & OPTYPE_UNDO && CTX_wm_manager(C) == wm) {'),
        'CANCEL_REPORTS': block(op_call, 'if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {'),
        'OPERATOR_FINISHED_BRANCH': block(op_call[op_call.index("        /* Important to run 'wm_operator_finished'"):], 'if (retval & OPERATOR_FINISHED) {'),
        'OPERATOR_RELEASE': block(op_call, 'else if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {'),
        'HANDLER_REMOVE': block(op_call, 'if (retval & (OPERATOR_CANCELLED | OPERATOR_FINISHED)) {', 2),
    }
    # These values cannot substitute into inserted native text accidentally.
    template = BASE + WM_BASE + SCENARIOS
    return re.sub(r'\b(' + '|'.join(values) + r')\b', lambda match: values[match[1]], template)


class PencilPanPaintProducerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        candidates = [shutil.which('clang++'), shutil.which('g++')]
        if os.name == 'nt':
            candidates += [r'C:/Program Files/LLVM/bin/clang++.exe',
                           r'C:/Program Files/Microsoft Visual Studio/18/Insiders/VC/Tools/Llvm/x64/bin/clang++.exe']
        compiler = next((str(p) for p in candidates if p and Path(p).is_file()), None)
        if not compiler:
            raise RuntimeError('C++17 compiler required; no evidence generated')
        cls.executables = {}
        for label, pan in [('historical', HISTORICAL_PAN), ('proposed', CORRECTED_PAN)]:
            code = build_source(pan)
            cpp = OUT / f'pencil_pan_{label}_connected.cc'
            cpp.write_text(code, encoding='utf-8')
            exe = OUT / ('pencil_pan_' + label + ('.exe' if os.name == 'nt' else ''))
            command = [compiler, '-std=c++17', '-O0', '-Wall', '-Wextra', '-pedantic', str(cpp), '-o', str(exe)]
            result = subprocess.run(command, capture_output=True, text=True)
            (OUT / f'pencil_pan_{label}_compile.log').write_text(result.stdout + result.stderr, encoding='utf-8')
            if result.returncode:
                raise RuntimeError(result.stderr)
            cls.executables[label] = exe
        cls.results = []

    def run_case(self, case, *arguments, historical=False):
        label = 'historical' if historical else 'proposed'
        result = subprocess.run([str(self.executables[label]), case, *map(str, arguments)], capture_output=True, text=True)
        entry = {'variant': label, 'case': case, 'arguments': list(arguments),
                 'returncode': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr}
        self.results.append(entry)
        (OUT / 'pencil_pan_connected_runs.json').write_text(json.dumps(self.results, indent=2), encoding='utf-8')
        if historical:
            self.assertNotEqual(result.returncode, 0, 'Actual old producer must fail corrected semantic assertions')
            self.assertIn('assertion', result.stderr.lower())
            expected = 'system_owner.queue.size()==1' if case == 'movement' else 'd->is_cancelled==cancel'
            self.assertIn(expected, result.stderr)
        else:
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_historical_nonzero_motion_fails_corrected_contract(self):
        self.run_case('movement', historical=True)

    def test_historical_cancelled_fails_corrected_contract(self):
        self.run_case('terminal', 4, 1, 0, 0, historical=True)

    def test_historical_failed_fails_corrected_contract(self):
        self.run_case('terminal', 5, 1, 0, 0, historical=True)

    def test_scope_is_exactly_two_precision_predicates(self):
        self.assertEqual(PREFIX, CORRECTED_PAN[:len(PREFIX)])
        self.assertEqual(SUFFIX, CORRECTED_SUFFIX.replace(NEW_MOVEMENT, OLD_MOVEMENT).replace(NEW_TERMINAL, OLD_TERMINAL))

    def test_native_registered_cancel_routes_match_fixture(self):
        for path, callback in [(SOURCE_PATHS[5], 'sculpt_brush_stroke_cancel'),
                               (SOURCE_PATHS[6], 'vpaint_cancel'),
                               (SOURCE_PATHS[7], 'wpaint_cancel'),
                               (SOURCE_PATHS[8], 'paint_cancel')]:
            self.assertIn('ot->cancel = ' + callback + ';', source(path))

    @classmethod
    def tearDownClass(cls):
        report = {
            'pin': PIN,
            'overlay_sha256': hashlib.sha256((REPO / 'patches/blender-ipad.patch').read_bytes()).hexdigest(),
            'source_inputs': {path: hashlib.sha256(text.encode()).hexdigest() for path, text in INPUTS.items()},
            'cache_directory': str(CACHE),
            'source_runtime': 'Every pinned input above explicitly acquired with preflight.get_source(pin,path,cache,False); patched files reconstructed by test_touch_extrude.changed_source against that cache.',
            'correction': 'Actual current producer compiled unchanged; two predicates plus comments are the scope oracle. Repository untouched by this suite.',
            'producer_variant': 'actual corrected current overlay; no simulated-correction fallback',
            'historical_producer_sha256': hashlib.sha256(HISTORICAL_PAN.encode()).hexdigest(),
            'historical_source_commit': 'c88c85de0f7c31081441157ac6b85a90b3963704',
            'historical_overlay_sha256': '44dbcce15cd14907e386033049326aac4248950181d7eb7248f55f1370e1a002',
            'historical_pin': 'd9b6fe34ddce527d93b97c0bf42ad92cebac4e4e',
            'tested_producer_sha256': hashlib.sha256(CORRECTED_PAN.encode()).hexdigest(),
            'scope': 'Full transformed handlePan, unchanged NavigationIOS ticket/capture policy, generator/lease, cursor/button constructors; actual WM packet queue admission, cursor/button/trackpad mapping, registered owner/context/lifetime admission, tombstone, interrupt/status cleanup; native four mode cancel bodies and generic native release branch.',
            'native_finished_scope': 'Exact OPERATOR_FINISHED branch and following cancellation else-if execute; wm_operator_finished plus undo/register active-id queries are instrumented boundaries. Ended asserts native Line/done, one modeled finish and handler removal without direct cancellation free. Cancelled/Failed preserve exact report/free/unlink/handler order and zero modeled finish.',
            'boundaries': ['UIKit messages, contact/action timing, and initial native brush allocation/modal owner binding are fixture setup.',
                           'Delayed action tests retain frozen recognizer provenance; actual cancelPointerCapture and TouchAdmission invalidation execute. Full UIKit reset/action timing remains outside scope.',
                           'GHOST trackpad/key storage, WM scheduling, coordinate/tablet preference transform calls, ED owner capture and BKE/brush effect allocations are instrumentation boundaries.',
                           'Native callback bodies and cancellation cleanup order execute; normal WM finish is an instrumented call boundary. No universal rollback, geometry/history/Undo or device claim.'],
            'runs': cls.results,
            'historical_failures_expected': 3,
        }
        (OUT / 'pencil_pan_connected_report.json').write_text(json.dumps(report, indent=2), encoding='utf-8')


for name in ('movement', 'expiry', 'mid_enqueue_expiry', 'tuple', 'replacement', 'capture', 'owner', 'untagged', 'navigation', 'early'):
    def test(self, case=name):
        self.run_case(case)
    setattr(PencilPanPaintProducerTests, 'test_connected_' + name, test)

for terminal_state in (3, 4, 5):
    for native_mode in (1, 2, 4, 8):
        for expired in (0, 1):
            def test(self, state=terminal_state, mode=native_mode, expired=expired):
                self.run_case('terminal', state, mode, expired, 0)
            setattr(PencilPanPaintProducerTests, f'test_terminal_state{terminal_state}_mode{native_mode}_expired{expired}', test)


def test_dyntopo_cancel_preserves_native_restore_boundary(self):
    self.run_case('terminal', 4, 1, 0, 1)


PencilPanPaintProducerTests.test_dyntopo_cancel_preserves_native_restore_boundary = test_dyntopo_cancel_preserves_native_restore_boundary

if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0], *UNITTEST_ARGS], verbosity=2)
