variable "authorization_policies" {
  description = "Authorization Policies"
  type        = any
}

variable "authorization_policies_defaults" {
  description = "Authorization Policies Defaults"
  type        = any
}

variable "all_policy_sets" {
  description = "All Policy Sets map"
  type        = map(any)
  default     = null
}

variable "authorization_profiles" {
  description = "Authoriation Profiles Map"
  type        = map(any)
  default     = null
}

variable "conditions_data" {
  description = "Conditions Data"
  type        = any
}
