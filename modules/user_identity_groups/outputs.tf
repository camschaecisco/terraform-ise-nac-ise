output "ids" {
  value       = { for k, v in ise_user_identity_group.user_identity_groups : k => v.id }
  description = "User Identity Group Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
