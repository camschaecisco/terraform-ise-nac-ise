
output "default_values" {
  description = "All default values."
  value       = local.defaults
}

output "model" {
  description = "Full model."
  value       = local.model
}

output "debug" {
  value = data.ise_network_access_condition.network_access_condition
}
