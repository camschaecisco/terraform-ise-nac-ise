output "ids" {
  value       = { for k, v in ise_internal_user.internal_users : k => v.id }
  description = "Internal User Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
