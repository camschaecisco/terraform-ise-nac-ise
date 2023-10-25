resource "ise_internal_user" "internal_users" {

  for_each               = var.internal_users
  name                   = each.key
  password               = try(each.value.password, var.internal_users_defaults.password, null)
  change_password        = try(each.value.change_password, var.internal_users_defaults.change_password, null)
  email                  = try(each.value.email, var.internal_users_defaults.email, null)
  account_name_alias     = try(each.value.account_name_alias, var.internal_users_defaults.account_name_alias, null)
  enable_password        = try(each.value.enable_password, var.internal_users_defaults.enable_password, null)
  enabled                = try(each.value.enabled, var.internal_users_defaults.enabled, null)
  password_never_expires = try(each.value.password_never_expires, var.internal_users_defaults.password_never_expires, null)
  first_name             = try(each.value.first_name, var.internal_users_defaults.first_name, null)
  last_name              = try(each.value.last_name, var.internal_users_defaults.last_name, null)
  password_id_store      = try(each.value.password_id_store, var.internal_users_defaults.password_id_store, null)
  description            = try(each.value.description, var.internal_users_defaults.description, null)
  identity_groups        = try(var.all_user_identity_groups[each.value.user_identity_groups], null)
}
