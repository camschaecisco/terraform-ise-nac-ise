variable "security_groups_acl" {
  description = "Security Groups ACL"
  type        = any
}

variable "security_groups_acl_defaults" {
  description = "Security Groups ACL Defaults"
  type        = map(any)
}
