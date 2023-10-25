resource "ise_trustsec_security_group_acl" "sg_acl" {

  for_each = var.security_groups_acl

  acl_content = try(each.value.acl_content, var.security_groups_acl_defaults.acl_content, null)
  description = try(each.value.description, var.security_groups_acl_defaults.description, null)
  ip_version  = try(each.value.ip_version, var.security_groups_acl_defaults.ip_version, null)
  name        = each.key
}
