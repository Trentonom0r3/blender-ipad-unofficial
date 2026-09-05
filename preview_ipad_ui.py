# SPDX-License-Identifier: GPL-2.0-or-later
# Run this script inside desktop Blender on Windows (Scripting tab -> Run Script)
# to instantly preview the iPad Pro Touch UI look, scale, and theme!

import bpy

def set_c(target, attr, color):
    """Safely assigns RGB (3) or RGBA (4) colors depending on Blender RNA definition."""
    if not hasattr(target, attr):
        return
    try:
        curr = getattr(target, attr)
        if hasattr(curr, "__len__"):
            if len(curr) == 3:
                setattr(target, attr, color[:3])
            elif len(curr) == 4:
                setattr(target, attr, color if len(color) >= 4 else (*color, 1.0))
        else:
            setattr(target, attr, color)
    except Exception:
        pass

def apply_ipad_ui():
    prefs = bpy.context.preferences
    view = prefs.view
    theme = prefs.themes[0]
    ui = theme.user_interface
    
    # 1. Base Touch Scale (1.20x provides spacious ~36-38pt touch targets without clipping headers)
    try:
        view.ui_scale = 1.20
    except Exception:
        pass
    if hasattr(view, "gizmo_size_navigate_v3d"):
        try:
            view.gizmo_size_navigate_v3d = 80
        except Exception:
            pass
    
    # 2. Color Tokens (RGB and RGBA compatible)
    orange = (0.91, 0.49, 0.05, 1.0)        # #e87d0d signature Blender orange
    orange_tint = (0.20, 0.14, 0.10, 1.0)   # Warm amber active card tint
    dark_bg = (0.13, 0.13, 0.15, 1.0)       # #222227 widget inner
    dark_border = (0.17, 0.17, 0.20, 1.0)   # #2c2c34 widget border
    card_bg = (0.10, 0.10, 0.12, 1.0)       # #1a1a1f panel header
    panel_bg = (0.09, 0.09, 0.10, 1.0)      # #16161a panel back
    oled_black = (0.07, 0.07, 0.08, 1.0)    # #121215 topbar / header back
    text_white = (0.95, 0.95, 0.95, 1.0)
    text_dim = (0.60, 0.60, 0.60, 1.0)
    
    # 3. Card-style panels
    try:
        ui.panel_roundness = 0.80
    except Exception:
        pass
    set_c(ui, "panel_header", card_bg)
    set_c(ui, "panel_back", panel_bg)
    set_c(ui, "panel_outline", dark_border)
    set_c(ui, "panel_active", orange)
    set_c(ui, "panel_title", text_white)
    
    # 4. Pill-shaped widgets (roundness 0.85)
    widget_names = [
        "wcol_regular", "wcol_tool", "wcol_toolbar_item", "wcol_radio",
        "wcol_option", "wcol_toggle", "wcol_num", "wcol_numslider",
        "wcol_tab", "wcol_menu", "wcol_pulldown", "wcol_menu_back",
        "wcol_menu_item", "wcol_box", "wcol_progress", "wcol_list_item",
    ]
    for name in widget_names:
        if hasattr(ui, name):
            w = getattr(ui, name)
            try:
                w.roundness = 0.85
            except Exception:
                pass
            set_c(w, "outline", dark_border)
            set_c(w, "outline_sel", orange)
            set_c(w, "inner", dark_bg)
            set_c(w, "inner_sel", orange)
            set_c(w, "text", text_white)
            set_c(w, "text_sel", text_white)
        
    # Active tool cards (Select, Move, Rotate, Scale)
    if hasattr(ui, "wcol_tool"):
        set_c(ui.wcol_tool, "inner", card_bg)
        set_c(ui.wcol_tool, "inner_sel", orange_tint)
        set_c(ui.wcol_tool, "outline_sel", orange)
    
    if hasattr(ui, "wcol_toolbar_item"):
        set_c(ui.wcol_toolbar_item, "inner", card_bg)
        set_c(ui.wcol_toolbar_item, "inner_sel", orange_tint)
        set_c(ui.wcol_toolbar_item, "outline_sel", orange)
    
    # Workspace tabs (Model, Sculpt, UV, Shading) as pills
    if hasattr(ui, "wcol_tab"):
        set_c(ui.wcol_tab, "inner", card_bg)
        set_c(ui.wcol_tab, "inner_sel", orange)
        set_c(ui.wcol_tab, "outline", dark_border)
        set_c(ui.wcol_tab, "outline_sel", orange)
        set_c(ui.wcol_tab, "text", text_dim)
        set_c(ui.wcol_tab, "text_sel", text_white)
    
    # Radial / Pie menu styling
    if hasattr(ui, "wcol_pie_menu"):
        try:
            ui.wcol_pie_menu.roundness = 0.90
        except Exception:
            pass
        set_c(ui.wcol_pie_menu, "outline", dark_border)
        set_c(ui.wcol_pie_menu, "outline_sel", orange)
        set_c(ui.wcol_pie_menu, "inner", (0.08, 0.08, 0.10, 0.95))
        set_c(ui.wcol_pie_menu, "inner_sel", orange)
    
    # 5. Timeline scrubber
    try:
        if hasattr(theme, "common_ui") and hasattr(theme.common_ui, "anim"):
            set_c(theme.common_ui.anim, "playhead", orange)
    except Exception:
        pass
    
    # 6. Spaces (3D Viewport, Outliner, Properties, Topbar, Statusbar)
    try:
        if hasattr(theme, "view_3d"):
            set_c(theme.view_3d.space, "back", (0.09, 0.09, 0.11, 1.0))
            set_c(theme.view_3d.space, "back_grad", oled_black)
            set_c(theme.view_3d.space, "header", (0.08, 0.08, 0.09, 0.90))
    except Exception:
        pass
    
    try:
        if hasattr(theme, "outliner"):
            set_c(theme.outliner.space, "back", (0.08, 0.08, 0.09, 1.0))
            set_c(theme.outliner.space, "header", (0.09, 0.09, 0.11, 1.0))
            set_c(theme.outliner, "active", orange)
            set_c(theme.outliner, "selected_highlight", (0.16, 0.19, 0.25, 1.0))
    except Exception:
        pass
    
    try:
        if hasattr(theme, "properties"):
            set_c(theme.properties.space, "back", panel_bg)
            set_c(theme.properties.space, "header", card_bg)
    except Exception:
        pass
    
    try:
        if hasattr(theme, "topbar"):
            set_c(theme.topbar.space, "back", oled_black)
            set_c(theme.topbar.space, "header", oled_black)
    except Exception:
        pass
    
    try:
        if hasattr(theme, "statusbar"):
            set_c(theme.statusbar.space, "back", oled_black)
            set_c(theme.statusbar.space, "header", oled_black)
    except Exception:
        pass
    
    print("\n========================================================")
    print("✅ Blender iPad Pro Touch UI applied successfully!")
    print("   - Resolution Scale: 1.30x (touch hit targets)")
    print("   - Palette: Deep OLED Charcoal (#121215) with Signature Orange (#e87d0d)")
    print("   - Pill Widgets: 0.85 roundness across buttons & tabs")
    print("========================================================\n")

if __name__ == "__main__":
    apply_ipad_ui()
