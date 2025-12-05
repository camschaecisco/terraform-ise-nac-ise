variable "model" {
  description = "The ISE YAML model configuration"
  type        = any
  default     = {}
}

variable "defaults" {
  description = "Default values for ISE configuration with fallback hierarchy"
  type        = any
  default = {
    ise = {
      configuration = {
        network_access = {
          policy_sets = {
            state   = "enabled"
            default = false
            rank    = 9999
          }
          authorization_rules = {
            state   = "enabled"
            default = false
            rank    = 9999
          }
          authentication_rules = {
            state   = "enabled"
            default = false
            rank    = 9999
          }
        }
        device_admin = {
          policy_sets = {
            state   = "enabled"
            default = false
            rank    = 9999
          }
          authorization_rules = {
            state   = "enabled"
            default = false
            rank    = 9999
          }
          authentication_rules = {
            state   = "enabled"
            default = false
            rank    = 9999
          }
        }
        conditions = {
          max_nesting_level    = 7
          terminal_level_types = ["ConditionAttributes", "ConditionReference"]
        }
      }
    }
  }
}

variable "devices" {
  description = "List of ISE devices to configure"
  type = list(object({
    name     = string
    url      = string
    username = string
    password = string
    insecure = optional(bool, true)
    retries  = optional(number, 3)
  }))
  default = []
}

variable "deploy_mode" {
  description = "Deployment mode for the configuration (full, incremental, validate)"
  type        = string
  default     = "full"
  validation {
    condition     = contains(["full", "incremental", "validate"], var.deploy_mode)
    error_message = "deploy_mode must be one of: full, incremental, validate"
  }
}

variable "enable_7_level_nesting" {
  description = "Enable 7-level nesting support (Note: Terraform Framework currently limits to 5 levels)"
  type        = bool
  default     = false
}
variable "yaml_directories" {
  description = "List of directories containing YAML files"
  type        = set(string)
  default     = []
}

variable "yaml_files" {
  description = "List of YAML files"
  type        = set(string)
  default     = []
}

variable "config_file" {
  description = "Path to the YAML configuration file"
  type        = string
  default     = ""
}

variable "write_default_values_file" {
  description = "Write all default values to a specified file"
  type        = string
  default     = ""
}

variable "manage_trust_sec" {
  description = "Manage TrustSec configuration"
  type        = bool
  default     = false
}

variable "manage_device_administration" {
  description = "Manage Device Administration configuration"
  type        = bool
  default     = true
}

variable "manage_identity_management" {
  description = "Manage Identity Management configuration"
  type        = bool
  default     = true
}

variable "manage_network_access" {
  description = "Manage Network Access configuration"
  type        = bool
  default     = true
}

variable "manage_network_resources" {
  description = "Manage Network Resources configuration"
  type        = bool
  default     = true
}

variable "manage_system" {
  description = "Manage System configuration"
  type        = bool
  default     = true
}
