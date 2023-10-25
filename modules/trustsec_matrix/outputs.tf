output "ids" {
  value       = { for k, v in ise_trustsec_egress_matrix_cell.matrix : k => v.id }
  description = "TrustSec Egress Matrix Cell Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}

#output "sgt" {
#  value = data.ise_trustsec_security_group.security_groups
#}

#output "sgt_acl" {
#  value = data.ise_trustsec_security_group_acl.security_groups_acl
#}
