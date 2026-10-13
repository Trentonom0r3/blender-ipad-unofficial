/* SPDX-FileCopyrightText: 2001-2002 NaN Holding BV. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-or-later
 *
 * Exact selected source/blender/blenkernel/intern/material.cc bodies from
 * Blender pin d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e.
 * Original source Git blob: 1d2f0cf4e5bc2fee76f360a26fa3d814b1b367bc.
 * Allocator, synchronization and dependency graph effects are fixture boundaries.
 * Keep primary bodies exact; per-function hashes are checked by the test module.
 */

/* Native admission limit from source/blender/makesdna/DNA_material_types.h:255
 * at the same audited Blender pin. The final slot uses a signed short index. */
#define MAXMAT (32767 - 1)

Material ***BKE_object_material_array_p(Object *ob)
{
  if (ob->type == OB_MESH) {
    Mesh *mesh = static_cast<Mesh *>(ob->data);
    return &(mesh->mat);
  }
  if (ELEM(ob->type, OB_CURVES_LEGACY, OB_FONT, OB_SURF)) {
    Curve *cu = static_cast<Curve *>(ob->data);
    return &(cu->mat);
  }
  if (ob->type == OB_MBALL) {
    MetaBall *mb = static_cast<MetaBall *>(ob->data);
    return &(mb->mat);
  }
  if (ob->type == OB_CURVES) {
    Curves *curves = static_cast<Curves *>(ob->data);
    return &(curves->mat);
  }
  if (ob->type == OB_POINTCLOUD) {
    PointCloud *pointcloud = static_cast<PointCloud *>(ob->data);
    return &(pointcloud->mat);
  }
  if (ob->type == OB_VOLUME) {
    Volume *volume = static_cast<Volume *>(ob->data);
    return &(volume->mat);
  }
  if (ob->type == OB_GREASE_PENCIL) {
    GreasePencil *grease_pencil = static_cast<GreasePencil *>(ob->data);
    return &(grease_pencil->material_array);
  }
  return nullptr;
}
short *BKE_object_material_len_p(Object *ob)
{
  if (ob->type == OB_MESH) {
    Mesh *mesh = static_cast<Mesh *>(ob->data);
    return &(mesh->totcol);
  }
  if (ELEM(ob->type, OB_CURVES_LEGACY, OB_FONT, OB_SURF)) {
    Curve *cu = static_cast<Curve *>(ob->data);
    return &(cu->totcol);
  }
  if (ob->type == OB_MBALL) {
    MetaBall *mb = static_cast<MetaBall *>(ob->data);
    return &(mb->totcol);
  }
  if (ob->type == OB_CURVES) {
    Curves *curves = static_cast<Curves *>(ob->data);
    return &(curves->totcol);
  }
  if (ob->type == OB_POINTCLOUD) {
    PointCloud *pointcloud = static_cast<PointCloud *>(ob->data);
    return &(pointcloud->totcol);
  }
  if (ob->type == OB_VOLUME) {
    Volume *volume = static_cast<Volume *>(ob->data);
    return &(volume->totcol);
  }
  if (ob->type == OB_GREASE_PENCIL) {
    GreasePencil *grease_pencil = static_cast<GreasePencil *>(ob->data);
    return &(grease_pencil->material_array_num);
  }
  return nullptr;
}
Material ***BKE_id_material_array_p(ID *id)
{
  /* ensure we don't try get materials from non-obdata */
  BLI_assert(OB_DATA_SUPPORT_ID(GS(id->name)));

  switch (GS(id->name)) {
    case ID_ME:
      return &(((Mesh *)id)->mat);
    case ID_CU_LEGACY:
      return &(((Curve *)id)->mat);
    case ID_MB:
      return &(((MetaBall *)id)->mat);
    case ID_GD_LEGACY:
      return &(((bGPdata *)id)->mat);
    case ID_CV:
      return &(((Curves *)id)->mat);
    case ID_PT:
      return &(((PointCloud *)id)->mat);
    case ID_VO:
      return &(((Volume *)id)->mat);
    case ID_GP:
      return &(((GreasePencil *)id)->material_array);
    default:
      break;
  }
  return nullptr;
}
short *BKE_id_material_len_p(ID *id)
{
  /* ensure we don't try get materials from non-obdata */
  BLI_assert(OB_DATA_SUPPORT_ID(GS(id->name)));

  switch (GS(id->name)) {
    case ID_ME:
      return &(((Mesh *)id)->totcol);
    case ID_CU_LEGACY:
      return &(((Curve *)id)->totcol);
    case ID_MB:
      return &(((MetaBall *)id)->totcol);
    case ID_GD_LEGACY:
      return &(((bGPdata *)id)->totcol);
    case ID_CV:
      return &(((Curves *)id)->totcol);
    case ID_PT:
      return &(((PointCloud *)id)->totcol);
    case ID_VO:
      return &(((Volume *)id)->totcol);
    case ID_GP:
      return &(((GreasePencil *)id)->material_array_num);
    default:
      break;
  }
  return nullptr;
}
Material **BKE_object_material_get_p(Object *ob, short act)
{
  Material ***matarar, **ma_p;
  const short *totcolp;

  if (ob == nullptr) {
    return nullptr;
  }

  /* if object cannot have material, (totcolp == nullptr) */
  totcolp = BKE_object_material_len_p(ob);
  if (totcolp == nullptr || *totcolp == 0) {
    return nullptr;
  }

  /* Clamp to number of slots if index is out of range, same convention as used for rendering. */
  const int slot_index = clamp_i(act - 1, 0, *totcolp - 1);

  /* Fix inconsistency which may happen when library linked data reduces the number of
   * slots but object was not updated. Ideally should be fixed elsewhere. */
  ob->totcol = std::min<int>(*totcolp, ob->totcol);

  if (slot_index < ob->totcol && ob->matbits && ob->matbits[slot_index]) {
    /* Use object material slot. */
    ma_p = &ob->mat[slot_index];
  }
  else {
    /* Use data material slot. */
    matarar = BKE_object_material_array_p(ob);

    if (matarar && *matarar) {
      ma_p = &(*matarar)[slot_index];
    }
    else {
      ma_p = nullptr;
    }
  }

  return ma_p;
}
Material *BKE_object_material_get(Object *ob, short act)
{
  Material **ma_p = BKE_object_material_get_p(ob, act);
  /* Grease Pencil objects currently make the assumption that the returned material has Grease
   * Pencil settings. Ensure that this is the case otherwise return `nullptr`. */
  if (ob->type == OB_GREASE_PENCIL && ma_p != nullptr) {
    Material *ma = *ma_p;
    if (ma != nullptr) {
      return ma->gp_style != nullptr ? ma : nullptr;
    }
  }
  return ma_p ? *ma_p : nullptr;
}
static void object_material_assign(
    Main *bmain, Object *ob, Material *ma, short act, int assign_type, bool do_test_all)
{
  Material *mao, **matar, ***matarar;
  short *totcolp;
  char bit = 0;

  if (act > MAXMAT) {
    return;
  }
  act = std::max<int>(act, 1);

  /* test arraylens */

  totcolp = BKE_object_material_len_p(ob);
  matarar = BKE_object_material_array_p(ob);

  if (totcolp == nullptr || matarar == nullptr) {
    return;
  }

  if (act > *totcolp) {
    matar = MEM_calloc_arrayN<Material *>(act, "matarray1");

    if (*totcolp) {
      memcpy(matar, *matarar, sizeof(void *) * (*totcolp));
      MEM_freeN(*matarar);
    }

    *matarar = matar;
    *totcolp = act;
  }

  if (act > ob->totcol) {
    /* Need more space in the material arrays */
    ob->mat = static_cast<Material **>(
        MEM_recallocN_id(ob->mat, sizeof(void *) * act, "matarray2"));
    ob->matbits = static_cast<char *>(
        MEM_recallocN_id(ob->matbits, sizeof(char) * act, "matbits1"));
    ob->totcol = act;
  }

  /* Determine the object/mesh linking */
  if (assign_type == BKE_MAT_ASSIGN_EXISTING) {
    /* keep existing option (avoid confusion in scripts),
     * intentionally ignore userpref (default to obdata). */
    bit = ob->matbits[act - 1];
  }
  else if (assign_type == BKE_MAT_ASSIGN_USERPREF && ob->totcol && ob->actcol) {
    /* copy from previous material */
    bit = ob->matbits[ob->actcol - 1];
  }
  else {
    switch (assign_type) {
      case BKE_MAT_ASSIGN_OBDATA:
        bit = 0;
        break;
      case BKE_MAT_ASSIGN_OBJECT:
        bit = 1;
        break;
      case BKE_MAT_ASSIGN_USERPREF:
      default:
        bit = (U.flag & USER_MAT_ON_OB) ? 1 : 0;
        break;
    }
  }

  /* do it */

  ob->matbits[act - 1] = bit;
  if (bit == 1) { /* in object */
    mao = ob->mat[act - 1];
    if (mao) {
      id_us_min(&mao->id);
    }
    ob->mat[act - 1] = ma;
    BKE_object_materials_sync_length(bmain, ob, static_cast<ID *>(ob->data));
  }
  else { /* in data */
    mao = (*matarar)[act - 1];
    if (mao) {
      id_us_min(&mao->id);
    }
    (*matarar)[act - 1] = ma;
    /* Data may be used by several objects. */
    if (do_test_all) {
      BKE_objects_materials_sync_length_all(bmain, static_cast<ID *>(ob->data));
    }
  }

  if (ma) {
    id_us_plus(&ma->id);
  }

  DEG_id_tag_update(&ob->id, ID_RECALC_SYNC_TO_EVAL | ID_RECALC_GEOMETRY);
  DEG_relations_tag_update(bmain);
}
void BKE_object_material_assign(Main *bmain, Object *ob, Material *ma, short act, int assign_type)
{
  object_material_assign(bmain, ob, ma, act, assign_type, true);
}
