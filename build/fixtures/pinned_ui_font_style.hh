/* SPDX-FileCopyrightText: 2001-2002 NaN Holding BV. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Exact uiFontStyle/uiStyle declarations extracted from Blender
 * d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e, source/blender/makesdna/DNA_theme_types.h.
 * Source SHA256: 45933d533c69edb970b8bf5d67c33c5b437202eef71410c3300d8ecae243358f
 * Keep native fields independent of the modeled drawing/operator world.
 */

typedef struct uiFontStyle {
  /** Saved in file, 0 is default. */
  short uifont_id;
  char _pad1[2];
  /** Actual size depends on 'global' DPI. */
  float points;
  /** Style hint. */
  short italic, bold;
  /** Value is amount of pixels blur. */
  short shadow;
  /** Shadow offset in pixels. */
  short shadx, shady;
  char _pad0[2];
  /** Total alpha. */
  float shadowalpha;
  /** 1 value, typically white or black anyway. */
  float shadowcolor;
  /** Weight class 100-900, 400 is normal. */
  int character_weight;
} uiFontStyle;

typedef struct uiStyle {
  struct uiStyle *next, *prev;

  char name[/*MAX_NAME*/ 64];

  uiFontStyle paneltitle;
  uiFontStyle grouplabel;
  uiFontStyle widget;
  uiFontStyle tooltip;

  float panelzoom;

  /** In characters. */
  short minlabelchars;
  /** In characters. */
  short minwidgetchars;

  short columnspace;
  short templatespace;
  short boxspace;
  short buttonspacex;
  short buttonspacey;
  short panelspace;
  short panelouter;

  char _pad0[2];
} uiStyle;
