/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Exact unchanged registration bodies from Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e. */
void api_ui_item_common_translation(FunctionRNA *func)
{
  PropertyRNA *prop = RNA_def_string(func,
                                     "text_ctxt",
                                     nullptr,
                                     0,
                                     "",
                                     "Override automatic translation context of the given text");
  RNA_def_property_clear_flag(prop, PROP_NEVER_NULL);
  RNA_def_boolean(
      func, "translate", true, "", "Translate the given text, when UI translation is enabled");
}

static void api_ui_item_common_text(FunctionRNA *func)
{
  PropertyRNA *prop;

  prop = RNA_def_string(func, "text", nullptr, 0, "", "Override automatic text of the item");
  RNA_def_property_clear_flag(prop, PROP_NEVER_NULL);
  api_ui_item_common_translation(func);
}

static void api_ui_item_common(FunctionRNA *func)
{
  PropertyRNA *prop;

  api_ui_item_common_text(func);

  prop = RNA_def_property(func, "icon", PROP_ENUM, PROP_NONE);
  RNA_def_property_enum_items(prop, rna_enum_icon_items);
  RNA_def_property_ui_text(prop, "Icon", "Override automatic icon of the item");
}

static void api_ui_item_rna_common(FunctionRNA *func)
{
  PropertyRNA *parm;

  parm = RNA_def_pointer(func, "data", "AnyType", "", "Data from which to take property");
  RNA_def_parameter_flags(parm, PROP_NEVER_NULL, PARM_REQUIRED | PARM_RNAPTR);
  parm = RNA_def_string(func, "property", nullptr, 0, "", "Identifier of property in data");
  RNA_def_parameter_flags(parm, PropertyFlag(0), PARM_REQUIRED);
}
