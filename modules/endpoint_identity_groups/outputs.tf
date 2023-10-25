output "ids" {
  value       = { for k, v in ise_endpoint_identity_group.endpoint_identity_groups : k => v.id }
  description = "Endpoint Identity Group Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
