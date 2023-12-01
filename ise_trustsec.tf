resource "ise_trustsec_security_group" "trustsec_security_group" {
  for_each = { for group in try(local.ise.trust_sec.security_groups, []) : group.name => group if var.manage_trustsec }

  description       = try(each.value.description, local.defaults.ise.trust_sec.security_groups.description, null)
  name              = each.key
  propogate_to_apic = try(each.value.propagate_to_apic, local.defaults.ise.trust_sec.security_groups.propogate_to_apic, null)
  value             = try(each.value.value, local.defaults.ise.trust_sec.security_groups.value, null)
  is_read_only      = try(each.value.is_read_only, local.defaults.ise.trust_sec.security_groups.is_read_only, null)
}

resource "ise_trustsec_security_group_acl" "trustsec_security_group_acl" {
  for_each = { for acl in local.ise.trust_sec.security_group_acls : acl.name => acl if var.manage_trustsec }

  acl_content = try(each.value.acl_content, local.defaults.ise.trust_sec.security_group_acls.acl_content, null)
  description = try(each.value.description, local.defaults.ise.trust_sec.security_group_acls.description, null)
  ip_version  = try(each.value.ip_version, local.defaults.ise.trust_sec.security_group_acls.ip_version, null)
  name        = each.key

  depends_on = [ise_trustsec_security_group.trustsec_security_group]
}

locals {
  trustsec_matrix = { for cell in try(local.ise.trust_sec.matrix, []) : "${cell.src_sgt}-${cell.dst_sgt}" => cell if var.manage_trustsec }
  unique_sgts     = distinct(concat([for key, value in local.trustsec_matrix : value.src_sgt], [for key, value in local.trustsec_matrix : value.dst_sgt]))
  known_sgts      = [for group in try(local.ise.trust_sec.security_groups, []) : group.name]
  unknown_sgts    = setsubtract(local.unique_sgts, local.known_sgts)
  unique_sgacls   = distinct([for key, value in local.trustsec_matrix : value.sgacl_name])
  known_sgacls    = [for acl in local.ise.trust_sec.security_group_acls : acl.name]
  unknown_sgacls  = setsubtract(local.unique_sgacls, local.known_sgacls)
}

data "ise_trustsec_security_group" "trustsec_security_group" {
  for_each = toset(local.unknown_sgts)

  name = each.value
}

data "ise_trustsec_security_group_acl" "trustsec_security_group_acl" {
  for_each = toset(local.unknown_sgacls)

  name = each.value
}

resource "ise_trustsec_egress_matrix_cell" "trustsec_egress_matrix_cell" {
  for_each = local.trustsec_matrix

  source_sgt_id      = contains(local.known_sgts, each.value.src_sgt) ? ise_trustsec_security_group.trustsec_security_group[each.value.src_sgt].id : data.ise_trustsec_security_group.trustsec_security_group[each.value.src_sgt].id
  destination_sgt_id = contains(local.known_sgts, each.value.dst_sgt) ? ise_trustsec_security_group.trustsec_security_group[each.value.dst_sgt].id : data.ise_trustsec_security_group.trustsec_security_group[each.value.dst_sgt].id
  matrix_cell_status = each.value.rule_status
  sgacls             = contains(local.known_sgacls, each.value.sgacl_name) ? [ise_trustsec_security_group_acl.trustsec_security_group_acl[each.value.sgacl_name].id] : try([data.ise_trustsec_security_group_acl.trustsec_security_group_acl[each.value.sgacl_name].id], [])

  lifecycle {
    ignore_changes = [default_rule]
  }
}
