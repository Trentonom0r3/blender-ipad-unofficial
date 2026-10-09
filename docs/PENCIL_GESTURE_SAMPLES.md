# Recognizer-owned Pencil device and samples

This increment fixes two connected source paths: Finger Tap/Pan could borrow the
view's global Pencil touch, and Tap promoted a genuine zero-force sample to full
pressure. Each recognizer now freezes its actual device and numeric touch identity
at physical Begin, before superclass recognition. Foreign/additional contacts
cannot replace it. Motion/End/Cancel snapshot finite pressure/tilt before UIKit
teardown; reset clears every contact value. No UITouch is retained by these
recognizers. The view's existing touch storage remains for its own hover lifecycle.

Tap uses the peak measured pressure and its matching tilt. A calibrated sample,
including zero, supersedes unknown-force fallback; later unknown samples cannot
inflate the measured peak. Pan uses its latest sample. Missing force calibration
retains pressure1 fallback; invalid non-finite samples cannot overwrite valid
ones. Event-owned UserInputEvent snapshots feed the existing copied GHOST
cursor/button payloads and native WM pressure curve. This improves provenance;
steady pressure/tilt itself was already implemented.

Physical tip-down state remains separate from terminal actor/sample identity,
so native hover and Pencil-barrel interactions keep their existing admission.
The nine Base actions, More Tools inventory/style, press-circle browsing,
barrel Home/reset, native headers, close-left controls, finger navigation,
external hardware, HUD/ring receipts and native history/recovery are unchanged.
No Brush RNA, finger paint suppression or new cancellation packet is introduced.

Five connected checks execute the actual shipped contact/sample policy,
UserInputEvent fields/constructor/setter/selector, GHOST payload constructors and
pinned native WM tablet conversion/pressure curve, including10000 reuse/foreign-touch cycles,
zero/unknown/calibration transitions, Tap peak vs Pan latest, finite values and
immutable packets. Actual recognizer/action wiring and sampling-before-super are
checked. UIKit delivery/reset timing, Objective-C SDK objects, preference storage, native handler scheduling and brush effects remain separate boundaries.
The stock5.1.2 Window.event_simulate API has no pressure/tilt injection, so a native
host amplitude claim would be unsupported. Existing stock brush/Undo/Redo/Cancel
baselines remain applicable, without proving UIKit transport.

The broader uncaptured interrupted paint-terminal ownership and last-composited
finger/paint canvas contract remains unfinished in PENCIL_PAINT_CONTACT_NEXT.
An actor value is not a WM semantic owner lease. Do not emit an unleased fallback
release or claim mode-specific paint rollback. Independent final input/UX review,
full retained suite, pinned preflight, exact native build/full package/compiled
launch and preserved Weight cleanup checks precede delivery. No device acceptance
is claimed from source checks or packaging.
