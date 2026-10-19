# Bounded Pencil pan correction contract

Read-only audit, 2026-10-19 UTC. No repository changes, tests, builds or commits were performed. This is a proposal for after complete verification of the current pointer-assignment package, not authorization to interrupt or replace that build.

Current overlay SHA-256 rechecked: `44dbcce15cd14907e386033049326aac4248950181d7eb7248f55f1370e1a002`. Blender pin: `d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e`. Source was reconstructed with `build/test_touch_extrude.changed_source`; Temp GHOST materializations were not used. Saved complete reconstructed files: `pencil_pan_next_actual_{ios,nav,wm}.txt`. Line references below refer to those reconstructed current files.

## Confirmed scope and reachability

The saved `pencil_pan_characterization.json`, generated C++ and run log reproduce two producer defects. Actual `handlePan` reaches its precision suffix after touch admission, hardware ownership, ring capture, captured navigation/tool manipulation and finger branches return. `pencil_pan` is therefore true in this suffix. Pan recognizer `touchesBegan` freezes `pencil_paint_origin` before superclass delivery; its getter returns that value unchanged through this contact. The contact is acquired only from the paint-canvas presentation, excluding ring and navigation at the physical origin (`ios:365–392`, `nav:pencil_paint_at_start`).

1. On a nonzero Changed, the precision suffix appends `PAN_GESTURE` then `CURSOR_MOVE` (`ios:1598–1644`). The generator's pointer lease gate covers cursor/down/up, not pan. Its pan case produces an untagged trackpad scroll (`ios:1025`). WM maps that to `MOUSEPAN`; the real owner classifier treats it as Interrupt, cancels the original stroke and marks a tombstone which consumes the following owned motion.
2. Cancelled and Failed append the same ordinary up as Ended. `event_info.cancelled` remains false. The existing generator and GHOST button constructor faithfully carry that false value, so the WM owner path dispatches a normal native release, including the native Line finalizer.

The proof executes the extracted precision suffix, generator cases, constructors, WM classifier/admission/tombstone and native release branch. It models UIKit messages/action ordering, valid initial native ownership, portions of WM queue conversion/scheduling and brush effects. It does not establish device occurrence rate or actual geometry/history effects.

## Minimal coherent production change

Change only the existing precision suffix of `GHOST_WindowIOS.mm::handlePan` initially. Preserve every earlier ring/capture/finger return and every non-paint branch.

* Add `!event_info.pencil_paint.valid()` to the nonzero-translation condition that appends `PAN_GESTURE`. Continue updating cached translation. Tagged paint contacts produce their cursor motion only; an untagged Pencil still produces its existing pan and cursor sequence.
* In the existing terminal block, set `event_info.cancelled = event_info.pencil_paint.valid() && sender.state != UIGestureRecognizerStateEnded;` before adding the existing up. No additional release is synthesized. Normal Ended remains normal; untagged/unsupported Pencil terminal semantics remain unchanged.

The suppression predicate is frozen paint provenance, not a fresh hit test, current mode, presentation liveness, or mere Pencil device type. A tagged contact that has become stale, retired or mismatched must not degrade into an untagged navigation event. Suppressing the unwanted pan paired with that contact is different from suppressing independent finger, trackpad, hardware or untagged Pencil navigation. Do not remove the PAN case, classify every MOUSEPAN as owned motion, attach paint identity to general navigation, or swallow all navigation while a stroke exists. Real independent navigation retains the existing native interruption path.

Keep `generateUserInputEvents` unchanged unless connected testing proves a separate defect. Its exact tuple comparison already protects serial, generation, region and both original coordinates. Its queued-down state becomes true only after actual GHOST down enqueue. Matching motion/terminal uses that original enqueue lease even after presentation expiry; acquisition still requires a live ticket. A tagged up without actual enqueue is rejected. Terminal retires the serial once; old, repeated and foreign packets cannot release a replacement. Do not add a liveness check in front of an owned terminal, or replace the original tuple with the current presentation. Existing `cancelPointerCapture` already sends one cancelled terminal from its saved enqueued tuple/sample before invalidating recognizers (`ios:1413`).

## Required connected validation

Extend the existing pipeline/lease coverage, retaining the saved failure unchanged. The regression must execute the reconstructed precision producer, not start with handcrafted already-correct button packets. Extract real generator admission/cases, real cursor/button constructors, actual WM queue-capture and conversion blocks, and existing owner admission/interrupt/status cleanup. Assert resulting queue order and effects, not just source substrings.

| Case | Required result |
| --- | --- |
| Tagged Began, repeated nonzero/zero Changed, Ended | One down; no paired trackpad pan; ordered owned motion; one ordinary up; native completion/Line finalization only at Ended. |
| Tagged Cancelled and Failed after down | One flagged up; actual WM flag conversion; original registered owner receives its mode cancel exactly once; native modal release/Line finalizer is not called; ordinary status cleanup removes the owner. |
| Presentation expires after actual down | Matching motion and all terminal kinds retain original tuple and sample; cancellation/completion remains leased. Suppression does not depend on live presentation. |
| Token expires before down / Failed before down | No admitted down or up and no leaked untagged pan; no owner cancellation or shared-pointer release. |
| Repeated terminal, retired Changed, tuple mismatch, old contact during new contact | No leaked pan, no old up/motion delivered to replacement, and replacement lease remains intact. Vary every identity field. |
| `cancelPointerCapture` followed by delayed Changed/terminal | Exactly one original cancelled up, then no leaked navigation or replacement-owner effects. |
| Untagged/unsupported Pencil; finger scroll/flythrough; captured HUD/tool; ring; two/three-finger pan; direct/indirect pinch; hardware | Existing event kinds, ordering, modifiers, tablet values and ownership remain unchanged. Independent navigation still interrupts through existing WM policy when applicable. |

Keep original owner checks real where feasible: queue receipt and handler tuple, registered handler, original mode/operator/owner context, and cancellation tombstone. Any mocked initial native admission/brush effect boundary must remain explicitly labeled. Include the unchanged pre-correction producer as a historical failure input so the new assertions fail on the actual defect rather than only validating a hand-built correction.

Native cancel is mode-specific. The exact registered callbacks are Sculpt `sculpt_brush_stroke_cancel`, Vertex `vpaint_cancel`, Weight `wpaint_cancel` and Texture `paint_cancel` (`wm:5962`). Sculpt restores from its undo step only for the supported non-dyntopo cache path, then calls generic cleanup and frees its cache. Other callbacks use `paint_stroke_cancel`, whose pinned body calls `stroke_done`. Preserve Weight's existing cleanup ownership. Assert actual callback routing/cleanup order and exclusion of the normal Line release path. Do not assert universal rollback, untouched geometry, no native history effects, or new Undo guarantees.

Portability is mandatory: the disposable audit reads `PIN_ROOT/paint_stroke.cc` directly and therefore depends on existing cache contents. A tracked test must explicitly acquire every undeclared pinned input with `preflight.get_source(pin, path, cache, False)` (as `test_paint_terminal_contract.py` already does), or use reviewed tracked exact bodies with provenance/hashes. Test standalone and with a cache containing only declared preflight inputs; do not depend on earlier test execution or a developer's full cache. Preserve the current cloud-fixture failure evidence.

After the current package gate closes, implement the two scoped producer changes, run affected pipeline/lease/HUD-cancel/native-cancel and navigation-preservation checks plus the required full suite/pinned preflight, independently review exact overlay scope, then build the changed exact revision once. Full downloaded IPA and actual compiled producer/consumer verification remain separate gates. UIKit scheduling and real iPad stroke/navigation acceptance remain device evidence.
