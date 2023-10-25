resource "ise_network_access_condition" "conditions" {
  for_each = var.network_access_conditions

  condition_type  = try(each.value.condition_type, var.network_access_conditions_defaults.condition_type, null)
  is_negate       = try(each.value.is_negate, var.network_access_conditions_defaults.is_negate, null)
  attribute_name  = try(each.value.attribute_name, var.network_access_conditions_defaults.attribute_name, null)
  attribute_value = try(each.value.attribute_value, var.network_access_conditions_defaults.attribute_value, null)
  dictionary_name = try(each.value.dictionary_name, var.network_access_conditions_defaults.dictionary_name, null)
  operator        = try(each.value.operator, var.network_access_conditions_defaults.operator, null)
  description     = try(each.value.description, var.network_access_conditions_defaults.description, null)
  name            = each.key
  children        = try(each.value.children, null)
}
