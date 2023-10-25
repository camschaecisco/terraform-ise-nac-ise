#locals {
# children_conditions = distinct(flatten([for key, value in var.policy_sets : flatten([
#    for v in try(value.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] : [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
#  ])]))
#  conditions     = distinct(flatten([for key, v in var.policy_sets : try(v.condition.condition_type, null) == "ConditionReference" ? [v.condition.name] : []]))
#  all_conditions = distinct(concat(local.children_conditions, local.conditions))
#}

locals {
  all_conditions = { for condition in var.conditions_data : condition.name => condition.id }
}
#data "ise_network_access_condition" "conditions" {
# for_each = toset(local.all_conditions)
#  name     = each.key
#}

resource "ise_network_access_policy_set" "policy_sets" {
  for_each = var.policy_sets

  condition_type            = try(each.value.condition.condition_type, var.policy_sets_defaults.condition.condition_type, null)
  condition_is_negate       = try(each.value.condition.is_negate, var.policy_sets_defaults.condition.is_negate, null)
  condition_attribute_name  = try(each.value.condition.attribute_name, var.policy_sets_defaults.condition.attribute_name, null)
  condition_attribute_value = try(each.value.condition.attribute_value, var.policy_sets_defaults.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.condition.dictionary_name, var.policy_sets_defaults.condition.dictionary_name, null)
  condition_id              = try(local.all_conditions[each.value.condition.name], null)
  condition_operator        = try(each.value.condition.operator, var.policy_sets_defaults.condition.operator, null)
  description               = try(each.value.description, var.policy_sets_defaults.description)
  is_proxy                  = try(each.value.is_proxy, var.policy_sets_defaults.is_proxy)
  name                      = each.key
  service_name              = try(each.value.service_name, var.policy_sets_defaults.service_name)
  state                     = try(each.value.state, var.policy_sets_defaults.state)
  rank                      = try(each.value.rank, var.policy_sets_defaults.rank, null)
  children = try([for i in each.value.condition.children : {
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
