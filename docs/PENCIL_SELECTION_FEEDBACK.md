# Native Pencil selection feedback

The latest human ring/corner design remains authoritative: exact nine Base choices, native-only remaining Tools, common Tools appearance/icons/labels/empty center, accepted press-circle and Pencil-barrel Home, persistent choices, complete native Blender bars and collapsed close-left future controls. This increment does not redesign those surfaces.

## Connected visible change

Admitted native Box/Lasso drags show the same bounded transient cue as Move/Rotate/Scale: actual Box/Lasso Replace/Add/Remove, Lift to apply and Two-finger drag to cancel. The native shape remains. Hardware, modified input, non-View3D, wait-for-input, non-selection gestures and unregistered/modal macro paths retain native behavior without this cue. Only existing selection feedback is added; this is not a new editing operation.

## Ownership and rendering

Capture follows successful exact registered native modal handler creation. Gesture calloc owns only POD mode/context/operator/type lifetime values; user_data is untouched. Drawing scans fresh live modal and gesture lists, checks registration/callback/lifetimes and reconstructs the original area/WINDOW from numeric values. Tool/context/geometry mismatch permanently retires the cue. Popup visibility suppresses the overlay. Native wm_gesture_draw leaves a subwindow viewport; wmWindowViewport restores the full-window viewport/scissor/ortho/model identity before regional translation. The shared UI cue retains measured fitting, clipped rows and existing theme styling. Context restores area before region on every mutation exit.

Box retires feedback before terminal exec; Lasso tears down its native gesture before exec. Native pointer Cancel remains before apply. Common native teardown/bulk removal frees the gesture and its cue values; no draw callback or old operator/RNA/Undo pointer is retained. Two-finger drag already enqueues pointer Cancel before navigation. Two-finger tap remains Undo, and squeeze while Pencil touches remains ignored.

## Evidence and remaining work

All275 host tests and98-file offline pinned preflight pass. Four connected selection fixtures execute actual overlay invoke/draw/apply/Cancel prefix/teardown seams with10,000 owner/stale/geometry/popup cycles; handler/context/alloc/GPU boundaries are modeled. Four existing Transform cue checks remain passing. Independent UX and native correctness reviewers found no prebuild blocker. Stock5.1.2 native Box/Lasso shape and Escape probes are inspected; the cue reconstruction uses exact compiled portable geometry and actual native font/theme, not the target patched WM/GHOST/GPU branch. See output/ui-preview/pencil-selection-cue.

Candidate still needs one exact native build, downloaded full archive/arm64/whole UI/icon checks and preserved compiled launch audit. No target native/package/device acceptance is claimed yet; latest verified IPA remains37883530390@5deae339. The full personal Pencil-first goal remains unfinished. Preserve Files/Color/software keyboard/native numeric Cancel/one-step history, Inspector/editors/splits/hardware and bounded modeling/Transform recovery. Import/deep-camera expansion remains deferred except regressions.
