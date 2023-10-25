locals {
  ise                                 = try(local.model.ise, {})
  network_access_conditions           = try({ for condition in local.ise.policy.network_access_conditions : condition.name => condition }, {})
  policy_sets                         = try({ for policy in local.ise.policy.policy_sets : policy.name => policy }, {})
  authorization_policies              = try({ for policy in local.ise.policy.authorization_policies : policy.name => policy }, {})
  authentication_policies             = try({ for policy in local.ise.policy.authentication_policies : policy.name => policy }, {})
  authorization_profiles              = try({ for profile in local.ise.policy.authorization_profiles : profile.name => profile }, {})
  allowed_protocols                   = try({ for protocol in local.ise.policy.allowed_protocols : protocol.name => protocol }, {})
  certificate_authentication_profiles = try({ for profile in local.ise.identity_management.certificate_authentication_profiles : profile.name => profile }, {})
  endpoint_identity_groups            = try({ for group in local.ise.identity_management.endpoint_identity_groups : group.name => group }, {})
  user_identity_groups                = try({ for group in local.ise.identity_management.user_identity_groups : group.name => group }, {})
  internal_users                      = try({ for user in local.ise.identity_management.internal_users : user.name => user }, {})
  security_groups                     = try({ for group in local.ise.trust_sec.security_groups : group.name => group }, {})
  security_groups_acl                 = try({ for acl in local.ise.trust_sec.security_groups_acl : acl.name => acl }, {})
  trustsec_matrix                     = try({ for cell in local.ise.trust_sec.matrix : "${cell.src_sgt}-${cell.dst_sgt}" => cell }, {})
  repositories                        = try({ for repository in local.ise.administration.repositories : repository.name => repository }, {})

  children_conditions_policy_sets = flatten([
    for key, value in local.policy_sets : flatten([
      for v in try(value.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] :
      [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
    ])
  ])

  conditions_policy_sets = flatten(
    [for key, v in local.policy_sets : try(v.condition.condition_type, null) == "ConditionReference" ? [v.condition.name] : []]
  )

  children_conditions_authz_policies = flatten([
    for key, value in local.authorization_policies : flatten([
      for v in try(value.rule.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] :
      [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
    ])
  ])

  conditions_authz_policies = flatten(
    [for key, v in local.authorization_policies : try(v.rule.condition.condition_type, null) == "ConditionReference" ? [v.rule.condition.name] : []]
  )

  children_conditions_auth_policies = flatten([
    for key, value in local.authentication_policies : flatten([
      for v in try(value.rule.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] :
      [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
    ])
  ])

  conditions_auth_policies = flatten(
    [for key, v in local.authentication_policies : try(v.rule.condition.condition_type, null) == "ConditionReference" ? [v.rule.condition.name] : []]
  )

  all_conditions = distinct(concat(local.children_conditions_policy_sets, local.conditions_policy_sets, local.children_conditions_authz_policies, local.conditions_authz_policies, local.children_conditions_auth_policies, local.conditions_auth_policies))
}
