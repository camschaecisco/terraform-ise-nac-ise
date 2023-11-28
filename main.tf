data "ise_network_access_condition" "conditions" {
  for_each = toset(local.all_conditions)
  name     = each.key

  depends_on = [module.network_access_conditions]
}

module "allowed_protocols" {
  source = "./modules/allowed_protocols"

  allowed_protocols          = local.allowed_protocols
  allowed_protocols_defaults = try(local.defaults.ise.policy.allowed_protocols, null)
}

module "policy_sets" {
  source = "./modules/policy_sets"

  policy_sets          = local.policy_sets
  policy_sets_defaults = try(local.defaults.ise.policy.policy_sets, null)
  conditions_data      = data.ise_network_access_condition.conditions

  depends_on = [module.network_access_conditions, module.authorization_profiles, module.allowed_protocols]
}

module "authentication_policies" {
  source = "./modules/authentication_policies"

  authentication_policies_defaults = try(local.defaults.ise.policy.authentication_policies, null)
  authentication_policies          = local.authentication_policies
  all_policy_sets                  = try(module.policy_sets.ids, null)
  conditions_data                  = data.ise_network_access_condition.conditions


  depends_on = [module.policy_sets, module.network_access_conditions]
}

module "authorization_policies" {
  source = "./modules/authorization_policies"

  authorization_policies_defaults = try(local.defaults.ise.policy.authorization_policies, null)
  authorization_policies          = local.authorization_policies
  all_policy_sets                 = try(module.policy_sets.ids, null)
  authorization_profiles          = try(module.authorization_profiles.ids, null)
  conditions_data                 = data.ise_network_access_condition.conditions


  depends_on = [module.policy_sets, module.authorization_profiles, module.network_access_conditions, module.trustsec_security_groups, module.endpoint_identity_groups, module.user_identity_groups]
}

module "authorization_profiles" {
  source = "./modules/authorization_profiles"

  authorization_profiles_defaults = try(local.defaults.ise.policy.authorization_profiles, null)
  authorization_profiles          = local.authorization_profiles
}

module "network_access_conditions" {
  source = "./modules/network_access_conditions"

  network_access_conditions          = local.network_access_conditions
  network_access_conditions_defaults = try(local.defaults.ise.policy.network_access_conditions, null)

  #depends_on = [module.network_device_groups, module.network_access_dictionaries]
}

module "user_identity_groups" {
  source = "./modules/user_identity_groups"

  user_identity_groups_defaults = try(local.defaults.ise.administration.user_identity_groups, null)
  user_identity_groups          = local.user_identity_groups
}

module "internal_users" {
  source = "./modules/internal_users"

  internal_users_defaults  = try(local.defaults.ise.administration.internal_users, null)
  internal_users           = local.internal_users
  all_user_identity_groups = try(module.user_identity_groups.ids, null)

  depends_on = [module.user_identity_groups]
}

module "endpoint_identity_groups" {
  source = "./modules/endpoint_identity_groups"

  endpoint_identity_groups          = local.endpoint_identity_groups
  endpoint_identity_groups_defaults = try(local.defaults.ise.administration.endpoint_identity_groups, null)
}

module "certificate_authentication_profiles" {
  source = "./modules/certificate_authentication_profiles"

  certificate_authentication_profiles          = local.certificate_authentication_profiles
  certificate_authentication_profiles_defaults = try(local.defaults.ise.administration.certificate_authentication_profiles, null)
}

module "trustsec_security_groups" {
  source = "./modules/trustsec_security_groups"

  security_groups          = local.security_groups
  security_groups_defaults = try(local.defaults.ise.trust_sec.security_groups, null)
}

module "trustsec_security_groups_acl" {
  source = "./modules/trustsec_security_groups_acl"

  security_groups_acl          = local.security_groups_acl
  security_groups_acl_defaults = try(local.defaults.ise.trust_sec.security_groups_acl, null)

  depends_on = [module.trustsec_security_groups]
}

module "trustsec_matrix" {
  source = "./modules/trustsec_matrix"

  trustsec_matrix         = local.trustsec_matrix
  security_groups_ids     = module.trustsec_security_groups.ids
  security_groups_acl_ids = module.trustsec_security_groups_acl.ids

  depends_on = [module.trustsec_security_groups, module.trustsec_security_groups_acl]
}

module "repositories" {
  source = "./modules/repositories"

  repositories          = local.repositories
  repositories_defaults = try(local.defaults.ise.administration.repositories, null)
}
