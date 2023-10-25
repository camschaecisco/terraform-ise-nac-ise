locals {
  endpoint_identity_groups_with_parent = { for k, v in var.endpoint_identity_groups : k => v if try(v.parent_group, "") != "" }
}

data "ise_endpoint_identity_group" "endpoint_identity_groups" {
  for_each = local.endpoint_identity_groups_with_parent
  name     = each.value.parent_group
}

resource "ise_endpoint_identity_group" "endpoint_identity_groups" {
  for_each = var.endpoint_identity_groups

  parent_endpoint_identity_group_id = try(data.ise_endpoint_identity_group.endpoint_identity_groups[each.key].id, null)
  description                       = try(each.value.description, var.endpoint_identity_groups_defaults.description, null)
  name                              = each.key
}
