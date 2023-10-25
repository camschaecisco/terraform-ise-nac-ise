output "ids" {
  value       = { for k, v in ise_network_access_authorization_rule.authorization_policies : k => v.id }
  description = "Authz Policy Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}

output "conditions" {
  value = local.all_conditions
}
