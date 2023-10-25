#output "policy_sets" {
#  value = { for policy_key, policy_value in ise_network_access_policy_set.policy_set : policy_key => regex("id:=([^\\\\]+)", policy_value.id)[0] }
#}

output "ids" {
  value       = { for k, v in ise_network_access_policy_set.policy_sets : k => v.id }
  description = "Map "
}
