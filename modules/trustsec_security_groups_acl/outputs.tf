output "ids" {
  value       = { for k, v in ise_trustsec_security_group_acl.sg_acl : k => v.id }
  description = "Security Group ACL Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
