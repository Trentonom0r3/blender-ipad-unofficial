# Native last-operation HUD: Pencil input admission

This is a bounded source audit for the next independent interaction increment. First verify exact ring correction run37703677904 at38e42d2. There is no HUD-receipt implementation or new device evidence yet. Preserve the user's preferred existing small lower-left panel; do not replace it with custom Numbers or embed its native Redo template in owned-ring provenance.

## Confirmed classification gap

Current materialized `screen_ipad_panels.cc:1657` subtracts only the last-presented optional shelf from `ipad_canvas_rect`. `wm_draw.cc:1311` publishes those remaining rectangles as ToolManipulation, with direct point-selection enabled for Box/Lasso. Its subsequent floating-menu clearing scans `screen->regionbase`; native HUD belongs to `area->regionbase`. Thus the visible HUD is incorrectly included in advertised direct-tool canvas input. Native UI may still consume it later. This proves a classification gap, not actual device tool stealing.

The HUD is a native overlapping float region preceding WINDOW, not one of the special `ipad_floating` editors. Adapted hit routing checks overlap regions first, but native View2D overlap margins and immediate hide/layout changes do not supply a last-presented ownership proof. Do not infer correct classification from eventual ordinary mouse handling.

## Required connected increment

Record what was composited at `wm_draw_window_area_layer` → `wm_draw_region_blend` (materialized `wm_draw.cc:1207/860`). Copy actual `rect_geo` only after reaching GPU_batch_draw; missing draw buffers and nonpositive alpha produce no receipt. The compositor rectangle has exclusive maxima after the +1 expansion; convert correctly to inclusive NavigationRect. Cached textures still reach blend. Preserve previous value-only footprint while native layout/redraw is pending, and publish only after the completed window pass. Retire when a completed onscreen pass omits the HUD or owner window/screen ends. Current winrct/runtime-visible/redraw tags are not proof: native `hud_region_hide` immediately zeros winrct while previous pixels remain until redraw.

Reserve ordinary UI capture ahead of ToolManipulation/point-selection capture, with direct_tool=false and direct_selection=false. Merely subtracting HUD to None loses actual contact origin: the Pencil fallback begins at the post-threshold touch_point, whereas the existing captured Navigation-style ordinary input retains origin for native numeric dragging. Preserve unrelated mouse/hardware routes. Bound the capture to actual exposed canvas/layer ordering so a HUD covered by Inspector, Tools, rails or higher menus does not gain precedence.

Receipts contain copied rectangles and numeric owner/generation/history evidence, never borrowed operators, RNA, UI blocks or region pointers. Guard the stale old footprint before field/button dispatch: hidden, changed-history, replaced-screen, moved/resized or otherwise no-longer-admitted HUD input must be consumed instead of becoming a native field callback or scene/tool click. Do not erase the old reservation merely because desired geometry changed. Reconstruct live owner/context before native UI lookup and retain native property/Redo/Cancel cleanup; this is separate from owned ring fields.

## Existing semantics to retain

Exact pinned HUD already supplies its collapsed header and content-sized native fields. Native number editing opens the software keyboard and accessory Done/Cancel; Cancel restores the original text. HUD changes repeat the existing accepted operator through ED_undo_operator_repeat. ui_apply_but_undo skips a separate HUD field Undo push. No confirmed keyboard-sign, history or sizing defect was found by this audit, so do not redesign those paths speculatively. Next drag configures future drags; this HUD adjusts the previous accepted operation. The inspected host preview currently shows its collapsed state, not expanded numeric editing.

## Meaningful validation

Execute actual compositor/publication/classification and native hit-admission seams with translated GPU/window boundaries. Cover no-buffer/alpha0, cached draw, failed/incomplete pass, hide-before-redraw, changed history/owner, old queued Begin/terminal, expanded/collapsed sizes, resize, narrow/portrait/split/quad panes, and overlapping Inspector/Tools/rails/menus. Box/Lasso point taps and Move drags over presented HUD must have no direct-tool provenance; ordinary UI starts at the original Pencil contact point. Changed old footprint must be consumed without a native field or canvas action. Verify unrelated hardware and outside-canvas parity.

Use actual stock native UI for expanded Move, signed decimal edits and Done/Cancel, then geometry plus one-step Undo/Redo. Stock/source fixtures are not patched target UIKit/GPU/modal or iPad acceptance. Do not broadly scale native Redo fields or call an existing ability a new iPad milestone.

Exact HUD source audit: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/editors/interface/regions/interface_region_hud.cc . The independent reviewer read it in memory; no persistent HUD cache exists. Current modified wm_draw/screen sources are available in the materialized Temp workspace and authoritative patch.
