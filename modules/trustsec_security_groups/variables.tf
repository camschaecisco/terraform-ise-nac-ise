variable "security_groups" {
  description = "Security Groups"
  type        = any
}

variable "security_groups_defaults" {
  description = "Security Groups Defaults"
  type        = map(any)
}
