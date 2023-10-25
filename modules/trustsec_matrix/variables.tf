#variable "security_groups" {
#  description = "Security Groups"
#  type        = any
#}

#variable "security_groups_defaults" {
#  description = "Security Groups Defaults"
#  type        = map(any)
#}

variable "trustsec_matrix" {
  description = "Trustsec Egress Matrix"
  type        = map(any)
}

variable "security_groups_ids" {
  description = "Security Groups IDs"
  type        = map(any)
}

variable "security_groups_acl_ids" {
  description = "Security Groups ACL IDs"
  type        = map(any)
}

#variable "security_groups_all" {
#  description = "Security Groups All"
#  type        = any
#}

#variable "sg_acl_all" {
#  description = "Security Groups ACL All"
#  type        = any
#}
