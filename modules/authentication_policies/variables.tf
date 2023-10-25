variable "authentication_policies" {
  description = "Authentication Policies"
  type        = any
}

variable "authentication_policies_defaults" {
  description = "Authentication Policies Defaults"
  type        = any
}

variable "all_policy_sets" {
  description = "All Policy Sets map"
  type        = map(any)
  default     = null
}

variable "conditions_data" {
  description = "Conditions Data"
  type        = any
}
