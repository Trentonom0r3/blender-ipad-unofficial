/* SPDX-FileCopyrightText: Blender Authors
 * SPDX-License-Identifier: GPL-2.0-or-later
 *
 * Exact portable primary-source bodies for the pointer-assignment fixture.
 * Pin: d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e
 * Callee/native containers and allocation effects are explicit fixture boundaries.
 */

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/mesh.cc
 * SHA256(function UTF-8 LF): 7ec7195e590b3ebdbf4d5d598ef1229d6c57f84e9baa4222078ab5e4ff6a4105
 */
void BKE_mesh_assign_object(Main *bmain, Object *ob, Mesh *mesh)
{
  Mesh *old = nullptr;

  if (ob == nullptr) {
    return;
  }

  multires_force_sculpt_rebuild(ob);

  if (ob->type == OB_MESH) {
    old = static_cast<Mesh *>(ob->data);
    if (old) {
      id_us_min(&old->id);
    }
    ob->data = mesh;
    id_us_plus((ID *)mesh);
  }

  BKE_object_materials_sync_length(bmain, ob, (ID *)mesh);

  BKE_modifiers_test_object(ob);
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/multires.cc
 * SHA256(function UTF-8 LF): c8e7974e75cf0f15e1502a91c8dacba1d84188dc2aa98a410e1f01ae07848bb3
 */
void multires_force_sculpt_rebuild(Object *object)
{
  using namespace blender;
  multires_flush_sculpt_updates(object);

  if (object == nullptr || object->sculpt == nullptr) {
    return;
  }

  BKE_sculptsession_free_pbvh(*object);
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/paint.cc
 * SHA256(function UTF-8 LF): 12a7bd3f655f338ba8a1eb615b2631fd79cdb7c574ef4549f413e3a73c6c9e65
 */
void BKE_sculptsession_free_pbvh(Object &object)
{
  SculptSession *ss = object.sculpt;
  if (!ss) {
    return;
  }

  ss->pbvh.reset();
  ss->edge_to_face_offsets = {};
  ss->edge_to_face_indices = {};
  ss->edge_to_face_map = {};
  ss->vert_to_edge_offsets = {};
  ss->vert_to_edge_indices = {};
  ss->vert_to_edge_map = {};

  ss->preview_verts = {};

  ss->vertex_info.boundary.clear_and_shrink();
  ss->fake_neighbors.fake_neighbor_index = {};
  ss->topology_island_cache.reset();

  ss->clear_active_elements(false);
}


/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/material.cc
 * SHA256(function UTF-8 LF): d27014b65e7c0d4f8ece29f4e219beaf8185f700fef50197fe8b852ad3d4889e
 */
void BKE_id_material_resize(Main *bmain, ID *id, short totcol, bool do_id_user)
{
  Material ***matar = BKE_id_material_array_p(id);
  short *totcolp = BKE_id_material_len_p(id);

  if (matar == nullptr) {
    return;
  }
  if (totcol == *totcolp) {
    /* Prevent depsgraph update and relations tag when nothing changed. */
    return;
  }

  if (do_id_user && totcol < (*totcolp)) {
    short i;
    for (i = totcol; i < (*totcolp); i++) {
      id_us_min((ID *)(*matar)[i]);
    }
  }

  if (totcol == 0) {
    if (*totcolp) {
      MEM_freeN(*matar);
      *matar = nullptr;
    }
  }
  else {
    *matar = static_cast<Material **>(MEM_recallocN(*matar, sizeof(void *) * totcol));
  }
  *totcolp = totcol;

  DEG_id_tag_update(id, ID_RECALC_SYNC_TO_EVAL);
  DEG_relations_tag_update(bmain);
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/material.cc
 * SHA256(function UTF-8 LF): af12b3afe51f30b0ddda0b8237af16fa6da1b3549357a83c403cf1bde3c25ad4
 */
static void object_material_active_index_sanitize(Object *ob)
{
  if (ob->totcol && ob->actcol == 0) {
    ob->actcol = 1;
  }
  ob->actcol = std::min(ob->actcol, ob->totcol);
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/material.cc
 * SHA256(function UTF-8 LF): 2deb1322a22ff69c28bc764e5c6475b58de660226fd9570eafcd29fe01020d02
 */
void BKE_object_material_resize(Main *bmain, Object *ob, const short totcol, bool do_id_user)
{
  if (totcol == ob->totcol) {
    /* Prevent depsgraph update and relations tag when nothing changed. */
    return;
  }

  Material **newmatar;
  char *newmatbits;

  if (do_id_user && totcol < ob->totcol) {
    for (int i = totcol; i < ob->totcol; i++) {
      id_us_min((ID *)ob->mat[i]);
    }
  }

  if (totcol == 0) {
    if (ob->totcol) {
      MEM_freeN(ob->mat);
      MEM_freeN(ob->matbits);
      ob->mat = nullptr;
      ob->matbits = nullptr;
    }
  }
  else if (ob->totcol < totcol) {
    newmatar = MEM_calloc_arrayN<Material *>(totcol, "newmatar");
    newmatbits = MEM_calloc_arrayN<char>(totcol, "newmatbits");
    if (ob->totcol) {
      memcpy(newmatar, ob->mat, sizeof(void *) * ob->totcol);
      memcpy(newmatbits, ob->matbits, sizeof(char) * ob->totcol);
      MEM_freeN(ob->mat);
      MEM_freeN(ob->matbits);
    }
    ob->mat = newmatar;
    ob->matbits = newmatbits;
  }
  /* XXX(@ideasman42): why not realloc on shrink? */

  ob->totcol = totcol;

  DEG_id_tag_update(&ob->id, ID_RECALC_SYNC_TO_EVAL | ID_RECALC_GEOMETRY);
  DEG_relations_tag_update(bmain);
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/material.cc
 * SHA256(function UTF-8 LF): 9643e63aad5555f840449c69912261f3dcadf623e81f7054844bf84518d15fba
 */
void BKE_object_materials_sync_length(Main *bmain, Object *ob, ID *id)
{
  const short *totcol;

  if (id == nullptr || (totcol = BKE_id_material_len_p(id)) == nullptr) {
    return;
  }

  if ((ob->id.tag & ID_TAG_MISSING) == 0 && (id->tag & ID_TAG_MISSING) != 0) {
    /* Exception: In case the object is a valid data, but its obdata is an empty place-holder,
     * use object's material slots amount as reference.
     * This avoids losing materials in a local object when its linked obdata goes missing.
     * See #92780. */
    BKE_id_material_resize(bmain, id, short(ob->totcol), false);
  }
  else {
    /* Normal case: the use the obdata amount of materials slots to update the object's one. */
    BKE_object_material_resize(bmain, ob, *totcol, false);
    object_material_active_index_sanitize(ob);
  }
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/material.cc
 * SHA256(function UTF-8 LF): 2a23cfa46f586d0e1ac25b8570903ec34c0fc87f2bcec6a0466d1e1e42cfc6dd
 */
void BKE_objects_materials_sync_length_all(Main *bmain, ID *id)
{
  Object *ob;
  const short *totcol;

  if (id == nullptr || (totcol = BKE_id_material_len_p(id)) == nullptr) {
    return;
  }

  BKE_main_lock(bmain);
  int processed_objects = 0;
  for (ob = static_cast<Object *>(bmain->objects.first); ob;
       ob = static_cast<Object *>(ob->id.next))
  {
    if (ob->data == id) {
      BKE_object_material_resize(bmain, ob, *totcol, false);
      object_material_active_index_sanitize(ob);
      processed_objects++;
      BLI_assert(processed_objects <= id->us && processed_objects > 0);
      if (processed_objects == id->us) {
        break;
      }
    }
  }
  BKE_main_unlock(bmain);
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/context.cc
 * SHA256(function UTF-8 LF): fcc2e65ff9837ddea19edd007afcd6b4ed5422e44ab003f42c373ec0f93df297
 */
static bool ctx_data_pointer_verify(const bContext *C, const char *member, void **pointer)
{
  /* if context is nullptr, pointer must be nullptr too and that is a valid return */
  if (C == nullptr) {
    *pointer = nullptr;
    return true;
  }

  bContextDataResult result;
  if (ctx_data_get((bContext *)C, member, &result) == CTX_RESULT_OK) {
    BLI_assert(result.type == CTX_DATA_TYPE_POINTER);
    *pointer = result.ptr.data;
    return true;
  }

  *pointer = nullptr;
  return false;
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/context.cc
 * SHA256(function UTF-8 LF): 9edd620127f61045d102060567b81f0f0636c82eec98ae180fa4001eeaedba38
 */
Main *CTX_data_main(const bContext *C)
{
  Main *bmain;
  if (ctx_data_pointer_verify(C, "blend_data", (void **)&bmain)) {
    return bmain;
  }

  return C->data.main;
}

/* Source: https://raw.githubusercontent.com/blender/blender/d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e/source/blender/blenkernel/intern/context.cc
 * SHA256(function UTF-8 LF): 8dcb91664e04592709dd8285658ec35f5c90415b23c3a7a00b267c4fe3360f78
 */
Scene *CTX_data_scene(const bContext *C)
{
  Scene *scene;
  if (ctx_data_pointer_verify(C, "scene", (void **)&scene)) {
    return scene;
  }

  return C->data.scene;
}
