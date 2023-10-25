#locals {
#  children_conditions = distinct(flatten([for key, value in var.authentication_policies : flatten([
#    for v in try(value.rule.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] : [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
#  ])]))
#  conditions     = distinct(flatten([for key, v in var.authentication_policies : try(v.rule.condition.condition_type, null) == "ConditionReference" ? [v.rule.condition.name] : []]))
#  all_conditions = distinct(concat(local.children_conditions, local.conditions))
#}
#
#data "ise_network_access_condition" "conditions" {
# for_each = toset(local.all_conditions)
#  name     = each.key
#}

locals {
  all_conditions = { for condition in var.conditions_data : condition.name => condition.id }
}

resource "ise_network_access_authentication_rule" "authentication_policies" {
  for_each = var.authentication_policies

  policy_set_id             = var.all_policy_sets[each.value.policy_name]
  name                      = each.key
  rank                      = try(each.value.rule.rank, var.authentication_policies_defaults.rule.rank, null)
  default                   = try(each.value.rule.default, var.authentication_policies_defaults.rule.default, null)
  state                     = try(each.value.rule.state, var.authentication_policies_defaults.rule.state, null)
  condition_type            = try(each.value.rule.condition.condition_type, var.authentication_policies_defaults.rule.condition.condition_type, null)
  condition_id              = try(local.all_conditions[each.value.rule.condition.name], null)
  condition_is_negate       = try(each.value.rule.condition.is_negate, var.authentication_policies_defaults.rule.condition.is_negate, null)
  condition_attribute_name  = try(each.value.rule.condition.attribute_name, var.authentication_policies_defaults.rule.condition.attribute_name, null)
  condition_attribute_value = try(each.value.rule.condition.attribute_value, var.authentication_policies_defaults.rule.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.rule.condition.dictionary_name, var.authentication_policies_defaults.rule.condition.dictionary_name, null)
  condition_operator        = try(each.value.rule.condition.operator, var.authentication_policies_defaults.rule.condition.operator, null)
  identity_source_name      = try(each.value.identity_source_name, var.authentication_policies_defaults.identity_source_name, null)
  if_auth_fail              = try(each.value.if_auth_fail, var.authentication_policies_defaults.if_auth_fail, null)
  if_process_fail           = try(each.value.if_process_fail, var.authentication_policies_defaults.if_process_fail, null)
  if_user_not_found         = try(each.value.if_user_not_found, var.authentication_policies_defaults.if_user_not_found, null)

  children = try([for i in each.value.rule.condition.children : {
    attribute_name   = try(i.attribute_name, null)
    attribute_value  = try(i.attribute_value, null)
    condition_type   = try(i.condition_type, null)
    dictionary_name  = try(i.dictionary_name, null)
    dictionary_value = try(i.dictionary_value, null)
    is_negate        = try(i.is_negate, null)
    operator         = try(i.operator, null)
    id               = try(local.all_conditions[i.name], null)
    children = try([for j in i.children : {
      attribute_name   = try(j.attribute_name, null)
      attribute_value  = try(j.attribute_value, null)
      condition_type   = try(j.condition_type, null)
      dictionary_name  = try(j.dictionary_name, null)
      dictionary_value = try(j.dictionary_value, null)
      is_negate        = try(j.is_negate, null)
      operator         = try(j.operator, null)
      id               = try(local.all_conditions[i.name], null)
    }], null)
  }], null)
}
