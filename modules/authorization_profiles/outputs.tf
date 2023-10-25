output "ids" {
  value       = { for k, v in ise_authorization_profile.authorization_profiles : k => v.id }
  description = "Authz Profile Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
