/* Exact scalar accessors from Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e interface.cc.
 * Fixture external RNA APIs are supplied by the test. */
double ui_but_value_get(uiBut *but)
{
  double value = 0.0;

  if (but->editval) {
    return *(but->editval);
  }
  if (but->poin == nullptr && but->rnapoin.data == nullptr) {
    return 0.0;
  }

  if (but->rnaprop) {
    PropertyRNA *prop = but->rnaprop;

    BLI_assert(but->rnaindex != -1);

    switch (RNA_property_type(prop)) {
      case PROP_BOOLEAN:
        if (RNA_property_array_check(prop)) {
          value = double(RNA_property_boolean_get_index(&but->rnapoin, prop, but->rnaindex));
        }
        else {
          value = double(RNA_property_boolean_get(&but->rnapoin, prop));
        }
        break;
      case PROP_INT:
        if (RNA_property_array_check(prop)) {
          value = RNA_property_int_get_index(&but->rnapoin, prop, but->rnaindex);
        }
        else {
          value = RNA_property_int_get(&but->rnapoin, prop);
        }
        break;
      case PROP_FLOAT:
        if (RNA_property_array_check(prop)) {
          value = RNA_property_float_get_index(&but->rnapoin, prop, but->rnaindex);
        }
        else {
          value = RNA_property_float_get(&but->rnapoin, prop);
        }
        break;
      case PROP_ENUM:
        value = RNA_property_enum_get(&but->rnapoin, prop);
        break;
      default:
        value = 0.0;
        break;
    }
  }
  else if (but->pointype == ButPointerType::Char) {
    value = *(char *)but->poin;
  }
  else if (but->pointype == ButPointerType::Short) {
    value = *(short *)but->poin;
  }
  else if (but->pointype == ButPointerType::Int) {
    value = *(int *)but->poin;
  }
  else if (but->pointype == ButPointerType::Float) {
    value = *(float *)but->poin;
  }

  return value;
}
void ui_but_value_set(uiBut *but, double value)
{
  /* Value is a HSV value: convert to RGB. */
  if (but->rnaprop) {
    PropertyRNA *prop = but->rnaprop;

    if (RNA_property_editable(&but->rnapoin, prop)) {
      switch (RNA_property_type(prop)) {
        case PROP_BOOLEAN:
          if (RNA_property_array_check(prop)) {
            RNA_property_boolean_set_index(&but->rnapoin, prop, but->rnaindex, value);
          }
          else {
            RNA_property_boolean_set(&but->rnapoin, prop, value);
          }
          break;
        case PROP_INT:
          if (RNA_property_array_check(prop)) {
            RNA_property_int_set_index(&but->rnapoin, prop, but->rnaindex, int(value));
          }
          else {
            RNA_property_int_set(&but->rnapoin, prop, int(value));
          }
          break;
        case PROP_FLOAT:
          if (RNA_property_array_check(prop)) {
            RNA_property_float_set_index(&but->rnapoin, prop, but->rnaindex, value);
          }
          else {
            RNA_property_float_set(&but->rnapoin, prop, value);
          }
          break;
        case PROP_ENUM:
          if (RNA_property_flag(prop) & PROP_ENUM_FLAG) {
            int ivalue = int(value);
            /* toggle for enum/flag buttons */
            ivalue ^= RNA_property_enum_get(&but->rnapoin, prop);
            RNA_property_enum_set(&but->rnapoin, prop, ivalue);
          }
          else {
            RNA_property_enum_set(&but->rnapoin, prop, value);
          }
          break;
        default:
          break;
      }
    }

    /* we can't be sure what RNA set functions actually do,
     * so leave this unset */
    value = UI_BUT_VALUE_UNSET;
  }
  else if (!bool(but->pointype)) {
    /* pass */
  }
  else {
    /* first do rounding */
    if (but->pointype == ButPointerType::Char) {
      value = round_db_to_uchar_clamp(value);
    }
    else if (but->pointype == ButPointerType::Short) {
      value = round_db_to_short_clamp(value);
    }
    else if (but->pointype == ButPointerType::Int) {
      value = round_db_to_int_clamp(value);
    }
    else if (but->pointype == ButPointerType::Float) {
      float fval = float(value);
      if (fval >= -0.00001f && fval <= 0.00001f) {
        /* prevent negative zero */
        fval = 0.0f;
      }
      value = fval;
    }

    /* then set value with possible edit override */
    if (but->editval) {
      value = *but->editval = value;
    }
    else if (but->pointype == ButPointerType::Char) {
      value = *((char *)but->poin) = char(value);
    }
    else if (but->pointype == ButPointerType::Short) {
      value = *((short *)but->poin) = short(value);
    }
    else if (but->pointype == ButPointerType::Int) {
      value = *((int *)but->poin) = int(value);
    }
    else if (but->pointype == ButPointerType::Float) {
      value = *((float *)but->poin) = float(value);
    }
  }

  ui_but_update_select_flag(but, &value);
}
