/* Exact unchanged cleanup from Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e,
 * source/blender/windowmanager/intern/wm_event_system.cc. The overlay changes
 * conversion, not this native function; retaining it avoids inventing cleanup. */
static void wm_event_custom_free(wmEvent *event)
{
  if ((event->customdata && event->customdata_free) == 0) {
    return;
  }

  /* NOTE: pointer to #ListBase struct elsewhere. */
  if (event->custom == EVT_DATA_DRAGDROP) {
    ListBase *lb = static_cast<ListBase *>(event->customdata);
    WM_drag_free_list(lb);
  }
  else {
    MEM_freeN(event->customdata);
  }
}
