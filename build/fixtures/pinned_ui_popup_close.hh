/* Exact Blender 5.0 d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e
 * regions/interface_region_menu_popup.cc; external retval API is a fixture. */
void UI_popup_menu_close(const uiBlock *block, const bool is_cancel)
{
  UI_popup_menu_retval_set(block, is_cancel ? UI_RETURN_CANCEL : UI_RETURN_OK, true);
}

void UI_popup_menu_close_from_but(const uiBut *but, const bool is_cancel)
{
  UI_popup_menu_close(but->block, is_cancel);
}
