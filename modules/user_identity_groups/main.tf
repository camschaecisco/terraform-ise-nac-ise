resource "ise_user_identity_group" "user_identity_groups" {
  for_each = var.user_identity_groups

  parent      = try(each.value.parent, var.user_identity_groups_defaults.parent, null)
  description = try(each.value.description, var.user_identity_groups_defaults.description, null)
  name        = each.key
}
