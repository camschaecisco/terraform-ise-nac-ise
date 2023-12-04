resource "ise_device_administration_condition" "device_administration_condition" {
  for_each = { for condition in try(local.ise.device_administration.policy_elements.conditions, []) : condition.name => condition if var.manage_device_administration }

  condition_type  = try(each.value.type, local.defaults.ise.device_administration.policy_elements.conditions.type, null)
  is_negate       = try(each.value.is_negate, local.defaults.ise.device_administration.policy_elements.conditions.is_negate, null)
  attribute_name  = try(each.value.attribute_name, local.defaults.ise.device_administration.policy_elements.conditions.attribute_name, null)
  attribute_value = try(each.value.attribute_value, local.defaults.ise.device_administration.policy_elements.conditions.attribute_value, null)
  dictionary_name = try(each.value.dictionary_name, local.defaults.ise.device_administration.policy_elements.conditions.dictionary_name, null)
  operator        = try(each.value.operator, local.defaults.ise.device_administration.policy_elements.conditions.operator, null)
  description     = try(each.value.description, local.defaults.ise.device_administration.policy_elements.conditions.description, null)
  name            = each.key
  children = [for c in try(each.value.children, []) : {
    attribute_name   = try(c.attribute_name, null)
    attribute_value  = try(c.attribute_value, null)
    condition_type   = try(c.type, null)
    dictionary_name  = try(c.dictionary_name, null)
    dictionary_value = try(c.dictionary_value, null)
    is_negate        = try(c.is_negate, null)
    operator         = try(c.operator, null)
    name             = try(c.name, null)
    description      = try(c.description, null)
    children = [for c2 in try(c.children, []) : {
      attribute_name   = try(c2.attribute_name, null)
      attribute_value  = try(c2.attribute_value, null)
      condition_type   = try(c2.type, null)
      dictionary_name  = try(c2.dictionary_name, null)
      dictionary_value = try(c2.dictionary_value, null)
      is_negate        = try(c2.is_negate, null)
      operator         = try(c2.operator, null)
      name             = try(c2.name, null)
      description      = try(c2.description, null)
    }]
  }]
}

resource "ise_allowed_protocols_tacacs" "allowed_protocols_tacacs" {
  for_each = { for protocol in try(local.ise.device_administration.policy_elements.allowed_protocols, []) : protocol.name => protocol if var.manage_device_administration }

  description      = try(each.value.description, "")
  name             = each.key
  allow_pap_ascii  = try(each.value.allow_pap_ascii, local.defaults.ise.device_administration.policy_elements.allowed_protocols.allow_pap_ascii, null)
  allow_chap       = try(each.value.allow_chap, local.defaults.ise.device_administration.policy_elements.allowed_protocols.allow_chap, null)
  allow_ms_chap_v1 = try(each.value.allow_ms_chap_v1, local.defaults.ise.device_administration.policy_elements.allowed_protocols.allow_ms_chap_v1, null)
}

resource "ise_tacacs_profile" "tacacs_profile" {
  for_each = { for profile in try(local.ise.device_administration.policy_elements.tacacs_profiles, []) : profile.name => profile if var.manage_device_administration }

  name        = each.key
  description = try(each.value.description, local.defaults.ise.device_administration.policy_elements.tacacs_profiles.description, null)
  session_attributes = try([for i in each.value.session_attributes : {
    type  = try(i.type, local.defaults.ise.device_administration.policy_elements.tacacs_profiles.session_attributes.type, null)
    name  = try(i.name, local.defaults.ise.device_administration.policy_elements.tacacs_profiles.session_attributes.name, null)
    value = try(i.value, local.defaults.ise.device_administration.policy_elements.tacacs_profiles.session_attributes.value, null)
  }], null)
}

resource "ise_tacacs_command_set" "tacacs_command_set" {
  for_each = { for cs in try(local.ise.device_administration.policy_elements.command_sets, []) : cs.name => cs if var.manage_device_administration }

  name             = each.key
  description      = try(each.value.description, local.defaults.ise.device_administration.policy_elements.tacacs_command_sets.description, null)
  permit_unmatched = try(each.value.permit_unmatched, local.defaults.ise.device_administration.policy_elements.tacacs_command_sets.permit_unmatched, null)
  commands = try([for i in each.value.commands : {
    grant     = try(i.grant, local.defaults.ise.device_administration.policy_elements.tacacs_command_sets.commands.grant, null)
    command   = try(i.command, local.defaults.ise.device_administration.policy_elements.tacacs_command_sets.commands.command, null)
    arguments = try(i.arguments, local.defaults.ise.device_administration.policy_elements.tacacs_command_sets.commands.arguments, "")
  }], null)
}

resource "ise_device_administration_time_and_date_condition" "device_administration_time_and_date_condition" {
  for_each = { for c in try(local.ise.device_administration.policy_elements.time_data_conditions, []) : c.name => c if var.manage_device_administration }

  name                 = each.key
  description          = try(each.value.description, local.defaults.ise.device_administration.policy_elements.time_data_conditions.description, null)
  is_negate            = try(each.value.is_negate, local.defaults.ise.device_administration.policy_elements.time_data_conditions.is_negate, null)
  week_days            = try(each.value.week_days, local.defaults.ise.device_administration.policy_elements.time_data_conditions.week_days, null)
  week_days_exception  = try(each.value.week_days_exception, local.defaults.ise.device_administration.policy_elements.time_data_conditions.week_days_exception, null)
  start_date           = try(each.value.start_date, local.defaults.ise.device_administration.policy_elements.time_data_conditions.start_date, null)
  end_date             = try(each.value.end_date, local.defaults.ise.device_administration.policy_elements.time_data_conditions.end_date, null)
  exception_start_date = try(each.value.exception_start_date, local.defaults.ise.device_administration.policy_elements.time_data_conditions.exception_start_date, null)
  exception_end_date   = try(each.value.exception_end_date, local.defaults.ise.device_administration.policy_elements.time_data_conditions.exception_end_date, null)
  start_time           = try(each.value.start_time, local.defaults.ise.device_administration.policy_elements.time_data_conditions.start_time, null)
  end_time             = try(each.value.end_time, local.defaults.ise.device_administration.policy_elements.time_data_conditions.end_time, null)
  exception_start_time = try(each.value.exception_start_time, local.defaults.ise.device_administration.policy_elements.time_data_conditions.exception_start_time, null)
  exception_end_time   = try(each.value.exception_end_time, local.defaults.ise.device_administration.policy_elements.time_data_conditions.exception_end_time, null)
}

locals {
  conditions_device_administration_policy_sets = flatten([
    for v in try(local.ise.device_administration.policy_sets, []) : try(v.condition.type, null) == "ConditionReference" ? [v.condition.name] : [
      for v2 in try(v.condition.children, []) : try(v2.type, null) == "ConditionReference" ? [v2.name] : [
        for v3 in try(v2.children, []) : try(v3.type, null) == "ConditionReference" ? [v3.name] : []
      ]
    ]
  ])
  conditions_device_administration_policy_set_authentication_rules = flatten([
    for v in try(local.ise.device_administration.policy_sets, []) : [
      for r in try(v.authentication_rules, []) : try(r.condition.type, null) == "ConditionReference" ? [r.condition.name] : [
        for v2 in try(r.condition.children, []) : try(v2.type, null) == "ConditionReference" ? [v2.name] : [
          for v3 in try(v2.children, []) : try(v3.type, null) == "ConditionReference" ? [v3.name] : []
        ]
      ]
    ]
  ])
  conditions_device_administration_policy_set_authorization_rules = flatten([
    for v in try(local.ise.device_administration.policy_sets, []) : [
      for r in try(v.authorization_rules, []) : try(r.condition.type, null) == "ConditionReference" ? [r.condition.name] : [
        for v2 in try(r.condition.children, []) : try(v2.type, null) == "ConditionReference" ? [v2.name] : [
          for v3 in try(v2.children, []) : try(v3.type, null) == "ConditionReference" ? [v3.name] : []
        ]
      ]
    ]
  ])
  conditions_device_administration_policy_set_authorization_exception_rules = flatten([
    for v in try(local.ise.device_administration.policy_sets, []) : [
      for r in try(v.authorization_exception_rules, []) : try(r.condition.type, null) == "ConditionReference" ? [r.condition.name] : [
        for v2 in try(r.condition.children, []) : try(v2.type, null) == "ConditionReference" ? [v2.name] : [
          for v3 in try(v2.children, []) : try(v3.type, null) == "ConditionReference" ? [v3.name] : []
        ]
      ]
    ]
  ])
  conditions_device_administration_authorization_global_exception_rules = flatten([
    for v in try(local.ise.device_administration.authorization_global_exception_rules, []) : try(v.condition.type, null) == "ConditionReference" ? [v.condition.name] : [
      for v2 in try(v.condition.children, []) : try(v2.type, null) == "ConditionReference" ? [v2.name] : [
        for v3 in try(v2.children, []) : try(v3.type, null) == "ConditionReference" ? [v3.name] : []
      ]
    ]
  ])
  unique_conditions_device_administration  = distinct(concat(local.conditions_device_administration_policy_sets, local.conditions_device_administration_policy_set_authentication_rules, local.conditions_device_administration_policy_set_authorization_rules, local.conditions_device_administration_policy_set_authorization_exception_rules, local.conditions_device_administration_authorization_global_exception_rules))
  known_conditions_device_administration   = [for condition in try(local.ise.device_administration.policy_elements.conditions, []) : condition.name]
  unknown_conditions_device_administration = setsubtract(local.unique_conditions_device_administration, local.known_conditions_device_administration)
}

data "ise_device_administration_condition" "device_administration_condition" {
  for_each = toset(local.unknown_conditions_device_administration)

  name = each.value
}

resource "ise_device_administration_policy_set" "device_administration_policy_set" {
  for_each = { for policy in try(local.ise.device_administration.policy_sets, []) : policy.name => policy if var.manage_device_administration }

  condition_type            = try(each.value.condition.type, local.defaults.ise.device_administration.policy_sets.condition.type, null)
  condition_is_negate       = try(each.value.condition.is_negate, local.defaults.ise.device_administration.policy_sets.condition.is_negate, null)
  condition_attribute_name  = try(each.value.condition.attribute_name, local.defaults.ise.device_administration.policy_sets.condition.attribute_name, null)
  condition_attribute_value = try(each.value.condition.attribute_value, local.defaults.ise.device_administration.policy_sets.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.condition.dictionary_name, local.defaults.ise.device_administration.policy_sets.condition.dictionary_name, null)
  condition_id              = contains(local.known_conditions_device_administration, try(each.value.condition.name, "")) ? ise_device_administration_condition.device_administration_condition[each.value.condition.name].id : try(data.ise_device_administration_condition.device_administration_condition[each.value.condition.name].id, null)
  condition_operator        = try(each.value.condition.operator, local.defaults.ise.device_administration.policy_sets.condition.operator, null)
  description               = try(each.value.description, local.defaults.ise.device_administration.policy_sets.description)
  is_proxy                  = try(each.value.is_proxy, local.defaults.ise.device_administration.policy_sets.is_proxy)
  name                      = each.key
  service_name              = try(each.value.service_name, local.defaults.ise.device_administration.policy_sets.service_name)
  state                     = try(each.value.state, local.defaults.ise.device_administration.policy_sets.state)
  rank                      = try(each.value.rank, local.defaults.ise.device_administration.policy_sets.rank, null)
  children = try([for i in each.value.condition.children : {
    attribute_name   = try(i.attribute_name, null)
    attribute_value  = try(i.attribute_value, null)
    condition_type   = try(i.type, null)
    dictionary_name  = try(i.dictionary_name, null)
    dictionary_value = try(i.dictionary_value, null)
    is_negate        = try(i.is_negate, null)
    operator         = try(i.operator, null)
    id               = contains(local.known_conditions_device_administration, try(i.name, "")) ? ise_device_administration_condition.device_administration_condition[i.name].id : try(data.ise_device_administration_condition.device_administration_condition[i.name].id, null)
    children = try([for j in i.children : {
      attribute_name   = try(j.attribute_name, null)
      attribute_value  = try(j.attribute_value, null)
      condition_type   = try(j.type, null)
      dictionary_name  = try(j.dictionary_name, null)
      dictionary_value = try(j.dictionary_value, null)
      is_negate        = try(j.is_negate, null)
      operator         = try(j.operator, null)
      id               = contains(local.known_conditions_device_administration, try(j.name, "")) ? ise_device_administration_condition.device_administration_condition[j.name].id : try(data.ise_device_administration_condition.device_administration_condition[j.name].id, null)
    }], null)
  }], null)

  depends_on = [ise_allowed_protocols_tacacs.allowed_protocols_tacacs]
}

locals {
  device_administration_authentication_rules = flatten([
    for ps in try(local.ise.device_administration.policy_sets, []) : [
      for rule in try(ps.authentication_rules, []) : {
        key                       = format("%s/%s", ps.name, rule.name)
        policy_set_id             = ise_device_administration_policy_set.device_administration_policy_set[ps.name].id
        name                      = rule.name
        rank                      = try(rule.rank, local.defaults.ise.device_administration.policy_sets.authentication_rules.rank, null)
        default                   = try(rule.default, local.defaults.ise.device_administration.policy_sets.authentication_rules.default, null)
        state                     = try(rule.state, local.defaults.ise.device_administration.policy_sets.authentication_rules.state, null)
        condition_type            = try(rule.condition.type, local.defaults.ise.device_administration.policy_sets.authentication_rules.condition.type, null)
        condition_id              = contains(local.known_conditions_device_administration, try(rule.condition.name, "")) ? ise_device_administration_condition.device_administration_condition[rule.condition.name].id : try(data.ise_device_administration_condition.device_administration_condition[rule.condition.name].id, null)
        condition_is_negate       = try(rule.condition.is_negate, local.defaults.ise.device_administration.policy_sets.authentication_rules.condition.is_negate, null)
        condition_attribute_name  = try(rule.condition.attribute_name, local.defaults.ise.device_administration.policy_sets.authentication_rules.condition.attribute_name, null)
        condition_attribute_value = try(rule.condition.attribute_value, local.defaults.ise.device_administration.policy_sets.authentication_rules.condition.attribute_value, null)
        condition_dictionary_name = try(rule.condition.dictionary_name, local.defaults.ise.device_administration.policy_sets.authentication_rules.condition.dictionary_name, null)
        condition_operator        = try(rule.condition.operator, local.defaults.ise.device_administration.policy_sets.authentication_rules.condition.operator, null)
        identity_source_name      = try(rule.identity_source_name, local.defaults.ise.device_administration.policy_sets.authentication_rules.identity_source_name, null)
        if_auth_fail              = try(rule.if_auth_fail, local.defaults.ise.device_administration.policy_sets.authentication_rules.if_auth_fail, null)
        if_process_fail           = try(rule.if_process_fail, local.defaults.ise.device_administration.policy_sets.authentication_rules.if_process_fail, null)
        if_user_not_found         = try(rule.if_user_not_found, local.defaults.ise.device_administration.policy_sets.authentication_rules.if_user_not_found, null)
        children = try([for i in rule.condition.children : {
          attribute_name   = try(i.attribute_name, null)
          attribute_value  = try(i.attribute_value, null)
          condition_type   = try(i.type, null)
          dictionary_name  = try(i.dictionary_name, null)
          dictionary_value = try(i.dictionary_value, null)
          is_negate        = try(i.is_negate, null)
          operator         = try(i.operator, null)
          id               = contains(local.known_conditions_device_administration, try(i.name, "")) ? ise_device_administration_condition.device_administration_condition[i.name].id : try(data.ise_device_administration_condition.device_administration_condition[i.name].id, null)
          children = try([for j in i.children : {
            attribute_name   = try(j.attribute_name, null)
            attribute_value  = try(j.attribute_value, null)
            condition_type   = try(j.type, null)
            dictionary_name  = try(j.dictionary_name, null)
            dictionary_value = try(j.dictionary_value, null)
            is_negate        = try(j.is_negate, null)
            operator         = try(j.operator, null)
            id               = contains(local.known_conditions_device_administration, try(j.name, "")) ? ise_device_administration_condition.device_administration_condition[j.name].id : try(data.ise_device_administration_condition.device_administration_condition[j.name].id, null)
          }], null)
        }], null)
      }
    ]
  ])
}

resource "ise_device_administration_authentication_rule" "device_administration_authentication_rule" {
  for_each = { for rule in local.device_administration_authentication_rules : rule.key => rule if var.manage_device_administration }

  policy_set_id             = each.value.policy_set_id
  name                      = each.value.name
  rank                      = each.value.rank
  default                   = each.value.default
  state                     = each.value.state
  condition_type            = each.value.condition_type
  condition_id              = each.value.condition_id
  condition_is_negate       = each.value.condition_is_negate
  condition_attribute_name  = each.value.condition_attribute_name
  condition_attribute_value = each.value.condition_attribute_value
  condition_dictionary_name = each.value.condition_dictionary_name
  condition_operator        = each.value.condition_operator
  identity_source_name      = each.value.identity_source_name
  if_auth_fail              = each.value.if_auth_fail
  if_process_fail           = each.value.if_process_fail
  if_user_not_found         = each.value.if_user_not_found
  children                  = each.value.children
}

locals {
  device_administration_authorization_rules = flatten([
    for ps in try(local.ise.device_administration.policy_sets, []) : [
      for rule in try(ps.authorization_rules, []) : {
        key                       = format("%s/%s", ps.name, rule.name)
        policy_set_id             = ise_device_administration_policy_set.device_administration_policy_set[ps.name].id
        name                      = rule.name
        rank                      = try(rule.rank, local.defaults.ise.device_administration.policy_sets.authorization_rules.rank, null)
        default                   = try(rule.default, local.defaults.ise.device_administration.policy_sets.authorization_rules.default, null)
        state                     = try(rule.state, local.defaults.ise.device_administration.policy_sets.authorization_rules.state, null)
        condition_type            = try(rule.condition.type, local.defaults.ise.device_administration.policy_sets.authorization_rules.condition.type, null)
        condition_id              = contains(local.known_conditions_device_administration, try(rule.condition.name, "")) ? ise_device_administration_condition.device_administration_condition[rule.condition.name].id : try(data.ise_device_administration_condition.device_administration_condition[rule.condition.name].id, null)
        condition_is_negate       = try(rule.condition.is_negate, local.defaults.ise.device_administration.policy_sets.authorization_rules.condition.is_negate, null)
        condition_attribute_name  = try(rule.condition.attribute_name, local.defaults.ise.device_administration.policy_sets.authorization_rules.condition.attribute_name, null)
        condition_attribute_value = try(rule.condition.attribute_value, local.defaults.ise.device_administration.policy_sets.authorization_rules.condition.attribute_value, null)
        condition_dictionary_name = try(rule.condition.dictionary_name, local.defaults.ise.device_administration.policy_sets.authorization_rules.condition.dictionary_name, null)
        condition_operator        = try(rule.condition.operator, local.defaults.ise.device_administration.policy_sets.authorization_rules.condition.operator, null)
        profile                   = try(rule.profile, local.defaults.ise.device_administration.policy_sets.authorization_rules.profile, null)
        command_sets              = try(rule.command_sets, local.defaults.ise.device_administration.policy_sets.authorization_rules.command_sets, null)
        children = try([for i in rule.condition.children : {
          attribute_name   = try(i.attribute_name, null)
          attribute_value  = try(i.attribute_value, null)
          condition_type   = try(i.type, null)
          dictionary_name  = try(i.dictionary_name, null)
          dictionary_value = try(i.dictionary_value, null)
          is_negate        = try(i.is_negate, null)
          operator         = try(i.operator, null)
          id               = contains(local.known_conditions_device_administration, try(i.name, "")) ? ise_device_administration_condition.device_administration_condition[i.name].id : try(data.ise_device_administration_condition.device_administration_condition[i.name].id, null)
          children = try([for j in i.children : {
            attribute_name   = try(j.attribute_name, null)
            attribute_value  = try(j.attribute_value, null)
            condition_type   = try(j.type, null)
            dictionary_name  = try(j.dictionary_name, null)
            dictionary_value = try(j.dictionary_value, null)
            is_negate        = try(j.is_negate, null)
            operator         = try(j.operator, null)
            id               = contains(local.known_conditions_device_administration, try(j.name, "")) ? ise_device_administration_condition.device_administration_condition[j.name].id : try(data.ise_device_administration_condition.device_administration_condition[j.name].id, null)
          }], null)
        }], null)
      }
    ]
  ])
}

resource "ise_device_administration_authorization_rule" "device_administration_authorization_rule" {
  for_each = { for rule in local.device_administration_authorization_rules : rule.key => rule if var.manage_device_administration }

  policy_set_id             = each.value.policy_set_id
  name                      = each.value.name
  rank                      = each.value.rank
  default                   = each.value.default
  state                     = each.value.state
  condition_type            = each.value.condition_type
  condition_id              = each.value.condition_id
  condition_is_negate       = each.value.condition_is_negate
  condition_attribute_name  = each.value.condition_attribute_name
  condition_attribute_value = each.value.condition_attribute_value
  condition_dictionary_name = each.value.condition_dictionary_name
  condition_operator        = each.value.condition_operator
  profile                   = each.value.profile
  command_sets              = each.value.command_sets
  children                  = each.value.children

  depends_on = [ise_tacacs_profile.tacacs_profile, ise_tacacs_command_set.tacacs_command_set]
}

locals {
  device_administration_authorization_exception_rules = flatten([
    for ps in try(local.ise.device_administration.policy_sets, []) : [
      for rule in try(ps.authorization_exception_rules, []) : {
        key                       = format("%s/%s", ps.name, rule.name)
        policy_set_id             = ise_device_administration_policy_set.device_administration_policy_set[ps.name].id
        name                      = rule.name
        rank                      = try(rule.rank, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.rank, null)
        default                   = try(rule.default, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.default, null)
        state                     = try(rule.state, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.state, null)
        condition_type            = try(rule.condition.type, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.condition.type, null)
        condition_id              = contains(local.known_conditions_device_administration, try(rule.condition.name, "")) ? ise_device_administration_condition.device_administration_condition[rule.condition.name].id : try(data.ise_device_administration_condition.device_administration_condition[rule.condition.name].id, null)
        condition_is_negate       = try(rule.condition.is_negate, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.condition.is_negate, null)
        condition_attribute_name  = try(rule.condition.attribute_name, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.condition.attribute_name, null)
        condition_attribute_value = try(rule.condition.attribute_value, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.condition.attribute_value, null)
        condition_dictionary_name = try(rule.condition.dictionary_name, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.condition.dictionary_name, null)
        condition_operator        = try(rule.condition.operator, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.condition.operator, null)
        profile                   = try(rule.profile, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.profile, null)
        command_sets              = try(rule.command_sets, local.defaults.ise.device_administration.policy_sets.authorization_exception_rules.command_sets, null)
        children = try([for i in rule.condition.children : {
          attribute_name   = try(i.attribute_name, null)
          attribute_value  = try(i.attribute_value, null)
          condition_type   = try(i.type, null)
          dictionary_name  = try(i.dictionary_name, null)
          dictionary_value = try(i.dictionary_value, null)
          is_negate        = try(i.is_negate, null)
          operator         = try(i.operator, null)
          id               = contains(local.known_conditions_device_administration, try(i.name, "")) ? ise_device_administration_condition.device_administration_condition[i.name].id : try(data.ise_device_administration_condition.device_administration_condition[i.name].id, null)
          children = try([for j in i.children : {
            attribute_name   = try(j.attribute_name, null)
            attribute_value  = try(j.attribute_value, null)
            condition_type   = try(j.type, null)
            dictionary_name  = try(j.dictionary_name, null)
            dictionary_value = try(j.dictionary_value, null)
            is_negate        = try(j.is_negate, null)
            operator         = try(j.operator, null)
            id               = contains(local.known_conditions_device_administration, try(j.name, "")) ? ise_device_administration_condition.device_administration_condition[j.name].id : try(data.ise_device_administration_condition.device_administration_condition[j.name].id, null)
          }], null)
        }], null)
      }
    ]
  ])
}

resource "ise_device_administration_authorization_exception_rule" "device_administration_authorization_exception_rule" {
  for_each = { for rule in local.device_administration_authorization_exception_rules : rule.key => rule if var.manage_device_administration }

  policy_set_id             = each.value.policy_set_id
  name                      = each.value.name
  rank                      = each.value.rank
  default                   = each.value.default
  state                     = each.value.state
  condition_type            = each.value.condition_type
  condition_id              = each.value.condition_id
  condition_is_negate       = each.value.condition_is_negate
  condition_attribute_name  = each.value.condition_attribute_name
  condition_attribute_value = each.value.condition_attribute_value
  condition_dictionary_name = each.value.condition_dictionary_name
  condition_operator        = each.value.condition_operator
  profile                   = each.value.profile
  command_sets              = each.value.command_sets
  children                  = each.value.children

  depends_on = [ise_tacacs_profile.tacacs_profile, ise_tacacs_command_set.tacacs_command_set]
}

resource "ise_device_administration_authorization_global_exception_rule" "device_administration_authorization_global_exception_rule" {
  for_each = { for rule in try(local.ise.device_administration.authorization_global_exception_rules, []) : rule.key => rule if var.manage_device_administration }

  name                      = each.value.name
  rank                      = try(each.value.rank, local.defaults.ise.device_administration.authorization_global_exception_rules.rank, null)
  default                   = try(each.value.default, local.defaults.ise.device_administration.authorization_global_exception_rules.default, null)
  state                     = try(each.value.state, local.defaults.ise.device_administration.authorization_global_exception_rules.state, null)
  condition_type            = try(each.value.condition.type, local.defaults.ise.device_administration.authorization_global_exception_rules.condition.type, null)
  condition_id              = contains(local.known_conditions_device_administration, try(each.value.condition.name, "")) ? ise_device_administration_condition.device_administration_condition[each.value.condition.name].id : try(data.ise_device_administration_condition.device_administration_condition[each.value.condition.name].id, null)
  condition_is_negate       = try(each.value.condition.is_negate, local.defaults.ise.device_administration.authorization_global_exception_rules.condition.is_negate, null)
  condition_attribute_name  = try(each.value.condition.attribute_name, local.defaults.ise.device_administration.authorization_global_exception_rules.condition.attribute_name, null)
  condition_attribute_value = try(each.value.condition.attribute_value, local.defaults.ise.device_administration.authorization_global_exception_rules.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.condition.dictionary_name, local.defaults.ise.device_administration.authorization_global_exception_rules.condition.dictionary_name, null)
  condition_operator        = try(each.value.condition.operator, local.defaults.ise.device_administration.authorization_global_exception_rules.condition.operator, null)
  profile                   = try(each.value.profile, local.defaults.ise.device_administration.authorization_global_exception_rules.profile, null)
  command_sets              = try(each.value.command_sets, local.defaults.ise.device_administration.authorization_global_exception_rules.command_sets, null)
  children = try([for i in each.value.condition.children : {
    attribute_name   = try(i.attribute_name, null)
    attribute_value  = try(i.attribute_value, null)
    condition_type   = try(i.type, null)
    dictionary_name  = try(i.dictionary_name, null)
    dictionary_value = try(i.dictionary_value, null)
    is_negate        = try(i.is_negate, null)
    operator         = try(i.operator, null)
    id               = contains(local.known_conditions_device_administration, try(i.name, "")) ? ise_device_administration_condition.device_administration_condition[i.name].id : try(data.ise_device_administration_condition.device_administration_condition[i.name].id, null)
    children = try([for j in i.children : {
      attribute_name   = try(j.attribute_name, null)
      attribute_value  = try(j.attribute_value, null)
      condition_type   = try(j.type, null)
      dictionary_name  = try(j.dictionary_name, null)
      dictionary_value = try(j.dictionary_value, null)
      is_negate        = try(j.is_negate, null)
      operator         = try(j.operator, null)
      id               = contains(local.known_conditions_device_administration, try(j.name, "")) ? ise_device_administration_condition.device_administration_condition[j.name].id : try(data.ise_device_administration_condition.device_administration_condition[j.name].id, null)
    }], null)
  }], null)

  depends_on = [ise_tacacs_profile.tacacs_profile, ise_tacacs_command_set.tacacs_command_set]
}
