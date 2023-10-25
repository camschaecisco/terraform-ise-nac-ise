output "ids" {
  value       = { for k, v in ise_allowed_protocols.allowed_protocols : k => v.id }
  description = "Allowed Protocol Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
