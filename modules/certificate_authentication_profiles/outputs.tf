output "ids" {
  value       = { for k, v in ise_certificate_authentication_profile.cap : k => v.id }
  description = "Certificate Authentication Profile Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
