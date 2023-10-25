output "ids" {
  value       = { for k, v in ise_network_access_authentication_rule.authentication_policies : k => v.id }
  description = "Auth Policy Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
