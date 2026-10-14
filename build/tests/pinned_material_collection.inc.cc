/* SPDX-FileCopyrightText: 2001-2002 NaN Holding BV. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-or-later
 *
 * Exact selected source/blender/blenkernel/intern/material.cc bodies from
 * Blender pin d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e.
 * Original source Git blob: 1d2f0cf4e5bc2fee76f360a26fa3d814b1b367bc.
 * Allocator, refcount, geometry-index synchronization and dependency graph
 * effects are fixture boundaries. Native bodies remain unchanged.
 * Append intentionally has no MAXMAT admission check at this pin.
 */

/* From source/blender/makesdna/DNA_material_types.h:255 at the same pin. */
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

static void material_data_index_remove_id(ID *id, short index)
{
  /* ensure we don't try get materials from non-obdata */
  BLI_assert(OB_DATA_SUPPORT_ID(GS(id->name)));

  switch (GS(id->name)) {
    case ID_ME:
      BKE_mesh_material_index_remove((Mesh *)id, index);
      break;
    case ID_CU_LEGACY:
      BKE_curve_material_index_remove((Curve *)id, index);
      break;
    case ID_GP:
      BKE_grease_pencil_material_index_remove(reinterpret_cast<GreasePencil *>(id), index);
      break;
    case ID_MB:
    case ID_CV:
    case ID_PT:
    case ID_VO:
      /* No material indices for these object data types. */
      break;
    default:
      break;
  }
}

static void material_data_index_clear_id(ID *id)
{
  /* ensure we don't try get materials from non-obdata */
  BLI_assert(OB_DATA_SUPPORT_ID(GS(id->name)));

  switch (GS(id->name)) {
    case ID_ME:
      BKE_mesh_material_index_clear((Mesh *)id);
      break;
    case ID_CU_LEGACY:
      BKE_curve_material_index_clear((Curve *)id);
      break;
    case ID_MB:
    case ID_CV:
    case ID_PT:
    case ID_VO:
      /* No material indices for these object data types. */
      break;
    default:
      break;
  }
}

void BKE_id_material_append(Main *bmain, ID *id, Material *ma)
{
  Material ***matar = BKE_id_material_array_p(id);
  if (matar) {
    short *totcol = BKE_id_material_len_p(id);
    Material **mat = MEM_calloc_arrayN<Material *>((*totcol) + 1, "newmatar");
    if (*totcol) {
      memcpy(mat, *matar, sizeof(void *) * (*totcol));
    }
    if (*matar) {
      MEM_freeN(*matar);
    }

    *matar = mat;
    (*matar)[(*totcol)++] = ma;

    id_us_plus((ID *)ma);
    BKE_objects_materials_sync_length_all(bmain, id);

    DEG_id_tag_update(id, ID_RECALC_SYNC_TO_EVAL);
    DEG_relations_tag_update(bmain);
  }
}

Material *BKE_id_material_pop(Main *bmain, ID *id, int index_i)
{
  short index = short(index_i);
  Material *ret = nullptr;
  Material ***matar = BKE_id_material_array_p(id);
  if (matar) {
    short *totcol = BKE_id_material_len_p(id);
    if (index >= 0 && index < (*totcol)) {
      ret = (*matar)[index];
      id_us_min((ID *)ret);

      if (*totcol <= 1) {
        *totcol = 0;
        MEM_freeN(*matar);
        *matar = nullptr;
      }
      else {
        if (index + 1 != (*totcol)) {
          memmove((*matar) + index,
                  (*matar) + (index + 1),
                  sizeof(void *) * ((*totcol) - (index + 1)));
        }

        (*totcol)--;
        *matar = static_cast<Material **>(MEM_reallocN(*matar, sizeof(void *) * (*totcol)));
        BKE_objects_materials_sync_length_all(bmain, id);
      }

      material_data_index_remove_id(id, index);

      DEG_id_tag_update(id, ID_RECALC_SYNC_TO_EVAL);
      DEG_relations_tag_update(bmain);
    }
  }

  return ret;
}

void BKE_id_material_clear(Main *bmain, ID *id)
{
  Material ***matar = BKE_id_material_array_p(id);
  if (matar) {
    short *totcol = BKE_id_material_len_p(id);

    while ((*totcol)--) {
      id_us_min((ID *)((*matar)[*totcol]));
    }
    *totcol = 0;
    if (*matar) {
      MEM_freeN(*matar);
      *matar = nullptr;
    }

    BKE_objects_materials_sync_length_all(bmain, id);
    material_data_index_clear_id(id);

    DEG_id_tag_update(id, ID_RECALC_SYNC_TO_EVAL);
    DEG_relations_tag_update(bmain);
  }
}

void BKE_id_material_assign(Main *bmain, ID *id, Material *ma, short act)
{
  Material *mao, **matar, ***matarar;
  short *totcolp;

  if (act > MAXMAT) {
    return;
  }
  act = std::max<int>(act, 1);

  /* test arraylens */

  totcolp = BKE_id_material_len_p(id);
  matarar = BKE_id_material_array_p(id);

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

  /* in data */
  mao = (*matarar)[act - 1];
  if (mao) {
    id_us_min(&mao->id);
  }
  (*matarar)[act - 1] = ma;

  if (ma) {
    id_us_plus(&ma->id);
  }

  BKE_objects_materials_sync_length_all(bmain, id);
  DEG_id_tag_update(id, ID_RECALC_SYNC_TO_EVAL | ID_RECALC_GEOMETRY);
  DEG_relations_tag_update(bmain);
}
