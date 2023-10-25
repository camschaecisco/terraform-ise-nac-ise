output "ids" {
  value       = { for k, v in ise_network_access_condition.conditions : k => v.id }
  description = "Condition Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
