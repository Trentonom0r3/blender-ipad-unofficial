/* SPDX-FileCopyrightText: Blender Authors
 * SPDX-License-Identifier: GPL-2.0-or-later
 * Exact historical public wrapper (also unchanged in production196b54c).
 * Pin: d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e
 * Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/makesrna/intern/rna_access.cc
 * SHA256(function UTF-8 LF): dfdd2d992507c6a37f5c204c83d364707406b58055766caf64912049e1e254e3
 * Executed under a distinct symbol with retained tombstone backing and current
 * common update bodies; this isolates the old provider frontier, not a full
 * historical Blender runtime or allocator UAF.
 */
void RNA_property_update(bContext *C, PointerRNA *ptr, PropertyRNA *prop)
{
  rna_property_update(C, CTX_data_main(C), CTX_data_scene(C), ptr, prop);
}
