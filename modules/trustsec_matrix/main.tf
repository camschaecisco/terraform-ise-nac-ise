locals {
  src_sgts                 = distinct([for key, value in var.trustsec_matrix : value.src_sgt])
  dst_sgts                 = distinct([for key, value in var.trustsec_matrix : value.dst_sgt])
  unique_sgts              = distinct(concat(local.src_sgts, local.dst_sgts))
  unique_sgacl_name        = distinct([for key, value in var.trustsec_matrix : value.sgacl_name])
  security_groups_list     = [for key, value in var.security_groups_ids : key]
  security_groups_acl_list = [for key, value in var.security_groups_acl_ids : key]
  #default_rule_acl         = { "Deny IP" : "DENY_IP", "Permit IP" : "PERMIT_IP", "None" : "NONE" }
}

data "ise_trustsec_security_group" "security_groups" {
  for_each = toset(local.unique_sgts)
  name     = each.key
}

data "ise_trustsec_security_group_acl" "security_groups_acl" {
  for_each = toset(local.unique_sgacl_name)
  name     = each.key
}

resource "ise_trustsec_egress_matrix_cell" "matrix" {

  for_each = var.trustsec_matrix

  ##default_rule = contains(["Deny IP", "Permit IP"], each.value.sgacl_name) ? local.default_rule_acl[each.value.sgacl_name] : local.default_rule_acl["None"]
  destination_sgt_id = contains(local.security_groups_list, each.value.dst_sgt) ? var.security_groups_ids[each.value.dst_sgt] : data.ise_trustsec_security_group.security_groups[each.value.dst_sgt].id
  #destination_sgt_id = contains(local.security_groups_list, each.value.dst_sgt) ? var.security_groups_ids[each.value.dst_sgt] : var.security_groups_all[each.value.dst_sgt]
  matrix_cell_status = each.value.rule_status
  source_sgt_id      = contains(local.security_groups_list, each.value.src_sgt) ? var.security_groups_ids[each.value.src_sgt] : data.ise_trustsec_security_group.security_groups[each.value.src_sgt].id
  #source_sgt_id = contains(local.security_groups_list, each.value.src_sgt) ? var.security_groups_ids[each.value.src_sgt] : var.security_groups_all[each.value.src_sgt]
  sgacls = contains(local.security_groups_acl_list, each.value.sgacl_name) ? [var.security_groups_acl_ids[each.value.sgacl_name]] : [data.ise_trustsec_security_group_acl.security_groups_acl[each.value.sgacl_name].id]
  #sgacls = contains(local.security_groups_acl_list, each.value.sgacl_name) ? [var.security_groups_acl_ids[each.value.sgacl_name]] : [var.sg_acl_all[each.value.sgacl_name]]

  lifecycle {
    ignore_changes = [default_rule]
  }
}
