resource "ise_trustsec_security_group" "security_groups" {

  for_each = var.security_groups

  description       = try(each.value.description, var.security_groups_defaults.description, null)
  name              = each.key
  propogate_to_apic = try(each.value.propagate_to_apic, var.security_groups_defaults.propogate_to_apic, null)
  value             = try(each.value.value, var.security_groups_defaults.value, null)
  is_read_only      = try(each.value.is_read_only, var.security_groups_defaults.is_read_only, null)
}


#data "ise_trustsec_security_group" "security_groups" {
#  for_each = var.security_groups
#  name = each.key
#}
