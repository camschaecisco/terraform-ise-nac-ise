output "ids" {
  value       = { for k, v in ise_repository.repository : k => v.id }
  description = "Repository Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164'"
}
