/* SPDX-FileCopyrightText: 2023 Blender Authors
 * SPDX-License-Identifier: GPL-2.0-or-later
 *
 * Exact historical fork helper from production
 * 01e2b1a60797bead82d251fedac6bcd41e332be9, based on Blender pin
 * d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e.
 * Canonical LF source body SHA256:
 * 0f5b2dd4ce2a46fe4407ec441b608510f3cbd747fbd377e3a4b3445cf3288630.
 * This old body is retained ONLY as a failing regression baseline. Fixture
 * compilation renames the function; no old implementation is shipped.
 */

static bool rna_ID_paint_owner_teardown(bContext *C,
                                       Main *bmain,
                                       ID **r_id,
                                       ID **related_ids,
                                       const int related_id_count,
                                       Scene **r_scene,
                                       ViewLayer **r_view_layer,
                                       ReportList *reports,
                                       const char *operation)
{
#ifdef WITH_APPLE_CROSSPLATFORM
  if (!bmain || !r_id || !*r_id || related_id_count < 0 || related_id_count > 2 ||
      (related_id_count && !related_ids))
  {
    if (reports) {
      BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: invalid identity", operation);
    }
    return false;
  }
  /* A non-active Main has no registered WM paint owner that can reference it. */
  if (bmain != G_MAIN) {
    return true;
  }

  RnaIDOverrideState override_state;
  if (!rna_ID_override_state_capture(*r_id, &override_state)) {
    if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: invalid override owner", operation);
    return false;
  }
  RnaIDOverrideIdentity identities[4]{};
  int id_count = 0;
  const auto capture_id = [&](ID *id) {
    if (id_count >= 4 || !rna_ID_override_identity_capture(id, &identities[id_count])) {
      return false;
    }
    id_count++;
    return true;
  };
  if (!capture_id(*r_id)) {
    if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: invalid ID", operation);
    return false;
  }
  int scene_index = -1;
  if (r_scene) {
    if (!*r_scene) {
      if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: missing scene", operation);
      return false;
    }
    scene_index = id_count;
    if (!capture_id(reinterpret_cast<ID *>(*r_scene))) {
      if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: invalid scene", operation);
      return false;
    }
  }
  const uintptr_t view_layer_address = r_view_layer ? uintptr_t(*r_view_layer) : 0;
  if (view_layer_address && scene_index < 0) {
    if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: view layer has no scene", operation);
    return false;
  }
  const int related_start = id_count;
  for (int i = 0; i < related_id_count; i++) {
    if (related_ids[i] == nullptr) {
      if (id_count >= 4) return false;
      identities[id_count++] = {};
    }
    else if (!capture_id(related_ids[i])) {
      if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: invalid related ID", operation);
      return false;
    }
  }

  for (int attempt = 0; attempt < 256; attempt++) {
    bool did_teardown = false;
    if (!WM_event_ipad_pencil_paint_owner_teardown_next(C, bmain, &did_teardown)) {
      if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: paint owner could not be retired", operation);
      return false;
    }
    if (!did_teardown) {
      return true;
    }

    ID *ids[4]{};
    for (int i = 0; i < id_count; i++) {
      if (!identities[i].address) continue;
      if (!identities[i].session_uid) {
        if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: incomplete identity", operation);
        return false;
      }
      ID *live_id = nullptr;
      if (!rna_ID_override_identity_resolve(bmain, identities[i], &live_id)) {
        if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: an ID changed during paint cancellation", operation);
        return false;
      }
      ids[i] = live_id;
    }
    if (!rna_ID_override_state_matches(bmain, ids[0], override_state)) {
      if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: override owner changed during paint cancellation", operation);
      return false;
    }
    *r_id = ids[0];
    if (scene_index >= 0) {
      *r_scene = reinterpret_cast<Scene *>(ids[scene_index]);
    }
    for (int i = 0; i < related_id_count; i++) {
      related_ids[i] = ids[related_start + i];
    }
    if (r_view_layer &&
        !rna_ID_override_view_layer_reacquire(
            r_scene ? *r_scene : nullptr, view_layer_address, r_view_layer))
    {
      if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: view layer changed during paint cancellation", operation);
      return false;
    }
  }
  if (reports) BKE_reportf(reports, RPT_ERROR, "ID mutation %s was refused: too many paint owners", operation);
  return false;
#else
  UNUSED_VARS(C, bmain, r_id, related_ids, related_id_count, r_scene, r_view_layer, reports, operation);
  return true;
#endif
}
