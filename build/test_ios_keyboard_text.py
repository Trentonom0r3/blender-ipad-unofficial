"""Execute connected software text ownership; UIKit responder delivery is a boundary."""
import re
import unittest
import test_ipad_panels
from test_touch_extrude import changed_source
from test_compact_shelf import function

IOS = changed_source('intern/ghost/intern/GHOST_WindowIOS.mm')
HANDLERS = changed_source('source/blender/editors/interface/interface_handlers.cc')


def method(signature, cpp_signature):
    source = function(IOS, signature)
    source = source[source.index('{'):]
    # Translate only UIKit selectors/properties and locking. Owned string operations,
    # result validity, responder ordering, failure return and all native branches run.
    source = source.replace('@synchronized(self)', '')
    source = source.replace('[[text_field text] UTF8String]', 'text_field.utf8()')
    source = source.replace('[text_field resignFirstResponder]', 'text_field.resignFirstResponder()')
    source = source.replace('[text_field becomeFirstResponder]', 'text_field.becomeFirstResponder()')
    source = source.replace('[self setupKeyboard:keyboard_properties]', 'setupKeyboard(keyboard_properties)')
    source = source.replace('[self generateKeyboardReturnEvent]', 'generateKeyboardReturnEvent()')
    source = source.replace('[NSString stringWithUTF8String:original_text.c_str()]', 'original_text.c_str()')
    source = source.replace('text_field.text = nil;', 'text_field.text.reset();')
    return cpp_signature + source


class IOSKeyboardTextTests(unittest.TestCase):
    def test_actual_software_session_owns_cancel_and_final_bytes(self):
        fields = IOS.split('/* Keyboard handling. */', 1)[1].split('bool external_keyboard_connected;', 1)[0]
        fields = fields.replace('UITextField *text_field;', 'FakeField text_field;')
        setup = IOS.split('/* A new input session must not inherit', 1)[1].split('/* Convert the text box', 1)[0]
        setup = '/* A new input session must not inherit' + setup
        initial = IOS.split('/* Initialise text with existing string. */', 1)[1].split('/* Set keyboard type', 1)[0]
        initial = re.sub(r'\[NSString stringWithUTF8String:keyboard_properties.text_string\]',
                         'keyboard_properties.text_string', initial).replace('@""', '""')
        methods = '\n'.join(method(signature, cpp) for signature, cpp in (
            ('- (GHOST_TSuccess)popupOnscreenKeyboard:', 'int popupOnscreenKeyboard(const GHOST_KeyboardProperties &keyboard_properties)'),
            ('- (GHOST_TSuccess)hideOnscreenKeyboard', 'int hideOnscreenKeyboard()'),
            ('- (const char *)getLastKeyboardString', 'const char *getLastKeyboardString()'),
            ('- (void)handleCancelButton', 'void handleCancelButton()'),
        ))
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstring>
#include <optional>
#include <string>
#define IOS_INPUT_LOG(...)
#define GHOST_ASSERT(...)
constexpr bool YES=true,NO=false;
constexpr int GHOST_kSuccess=1,GHOST_kFailure=0;
struct GHOST_KeyboardProperties { const char *text_string=nullptr; };
struct FakeField {
 std::optional<std::string> text;
 bool userInteractionEnabled=false,admitted=true;
 int resigns=0;
 const char *utf8(){return text ? text->c_str() : nullptr;}
 bool becomeFirstResponder(){return admitted;}
 void resignFirstResponder(){++resigns;}
};
struct Keyboard {
FIELDS
 int returns=0;
 Keyboard():onscreen_keyboard_active(false),text_field_string_valid(false){}
 void generateKeyboardReturnEvent(){if(onscreen_keyboard_active)++returns;}
 void setupKeyboard(const GHOST_KeyboardProperties &keyboard_properties){
SETUP
INITIAL
 }
METHODS
};
int main(){
 Keyboard keyboard;
 assert(keyboard.getLastKeyboardString()==nullptr);
 // Fixture field storage models UIKit copying the supplied UTF-8 string.
 std::string original=std::string(10000,'x')+"\xE2\x9C\x93\xF0\x9F\x96\x8C";
 const std::string expected=original;
 assert(keyboard.popupOnscreenKeyboard({original.c_str()})==GHOST_kSuccess);
 original.assign(20000,'y');original.clear();original.shrink_to_fit();
 keyboard.text_field.text="edited";
 keyboard.handleCancelButton();assert(keyboard.returns==1);
 assert(*keyboard.text_field.text==expected);
 assert(keyboard.hideOnscreenKeyboard()==GHOST_kSuccess);
 assert(!keyboard.onscreen_keyboard_active&&!keyboard.text_field.userInteractionEnabled);
 assert(!keyboard.text_field.text&&keyboard.text_field.resigns==1);
 const char *result=keyboard.getLastKeyboardString();
 assert(result&&expected==result); // Owned bytes outlive clearing the UIKit field.
 assert(keyboard.popupOnscreenKeyboard({"new session"})==GHOST_kSuccess);
 assert(!keyboard.text_field_string_valid); // Previous terminal result cannot leak.
 keyboard.text_field.text="";
 result=keyboard.getLastKeyboardString();assert(result&&!*result);
 keyboard.hideOnscreenKeyboard();result=keyboard.getLastKeyboardString();assert(result&&!*result);
 keyboard.popupOnscreenKeyboard({"another"});keyboard.text_field.text.reset();
 keyboard.hideOnscreenKeyboard();assert(keyboard.getLastKeyboardString()==nullptr);
 keyboard.text_field.admitted=false;
 assert(keyboard.popupOnscreenKeyboard({"failed"})==GHOST_kFailure);
 assert(!keyboard.onscreen_keyboard_active&&!keyboard.text_field.userInteractionEnabled);
 keyboard.hideOnscreenKeyboard();assert(keyboard.getLastKeyboardString()==nullptr);
}
'''.replace('FIELDS', fields).replace('SETUP', setup).replace('INITIAL', initial).replace('METHODS', methods))

    def test_actual_native_consumers_preserve_hardware_buffer_without_software_result(self):
        end = function(HANDLERS, 'static void ui_textedit_end(')
        end = end.split('/* Hide keyboard and retrieve keyboard text */', 1)[1].split('#endif', 1)[0]
        event = HANDLERS.split('case EVT_TEXTEDIT: {', 1)[1].split('\n      default:', 1)[0]
        event = event.split('\n#endif', 1)[0]
        event = 'case EVT_TEXTEDIT: {' + event
        test_ipad_panels.IPadWorkspacePanelsTests()._run_source(r'''
#include <cassert>
#include <cstring>
#include <string>
using GHOST_WindowHandle=void *;
struct TextEdit {bool edit_string=true;};
struct Active {TextEdit text_edit;};
struct uiBut {Active *active;};
struct Window {void *ghostwin;};
const char *software_result=nullptr;
std::string native_buffer="hardware";
int writes=0,hides=0;
void GHOST_hideOnScreenKeyboard(void *){++hides;}
const char *GHOST_getKeyboardInput(void *){return software_result;}
void ui_textedit_string_set(uiBut *,TextEdit &,const char *value){assert(value);++writes;native_buffer=value;}
void finish(uiBut *but,Window *win){END}
constexpr int EVT_TEXTEDIT=1;
void edit(uiBut *but,Window *win,bool &changed,bool &update){switch(EVT_TEXTEDIT){EVENT}}
int main(){
 Active active;uiBut button{&active};Window window{nullptr};bool changed=false,update=false;
 finish(&button,&window);edit(&button,&window,changed,update);
 assert(native_buffer=="hardware"&&!writes&&!changed&&!update);
 software_result="";finish(&button,&window);
 assert(native_buffer.empty()&&writes==1);
 edit(&button,&window,changed,update);assert(writes==2&&changed&&update);
 software_result="\xE2\x9C\x93";finish(&button,&window);assert(native_buffer==software_result);
 software_result=nullptr;finish(nullptr,&window);edit(nullptr,&window,changed,update);
 assert(writes==3);
}
'''.replace('END', end).replace('EVENT', event))


if __name__ == '__main__':
    unittest.main()
