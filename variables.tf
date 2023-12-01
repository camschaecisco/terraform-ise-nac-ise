variable "yaml_directories" {
  description = "List of paths to YAML directories."
  type        = list(string)
  default     = []
}

variable "yaml_files" {
  description = "List of paths to YAML files."
  type        = list(string)
  default     = []
}

variable "model" {
  description = "As an alternative to YAML files, a native Terraform data structure can be provided as well."
  type        = map(any)
  default     = {}
}

variable "manage_policy" {
  description = "Flag to indicate if policy configuration should be managed."
  type        = bool
  default     = false
}

variable "manage_identity_management" {
  description = "Flag to indicate if identity management configuration should be managed."
  type        = bool
  default     = false
}

variable "manage_trustsec" {
  description = "Flag to indicate if TrustSec configuration should be managed."
  type        = bool
  default     = false
}

variable "manage_administration" {
  description = "Flag to indicate if administration configuration should be managed."
  type        = bool
  default     = false
}

variable "write_default_values_file" {
  description = "Write all default values to a YAML file. Value is a path pointing to the file to be created."
  type        = string
  default     = ""
}
