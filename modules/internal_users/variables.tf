variable "internal_users" {
  description = "Network Access User"
  type        = any
}

variable "internal_users_defaults" {
  description = "Network Access User Defaults"
  type        = map(any)
}

variable "all_user_identity_groups" {
  description = "All User Identity Groups map"
  type        = map(any)
}
