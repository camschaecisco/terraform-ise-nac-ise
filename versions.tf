terraform {
  required_version = ">= 1.3"

  required_providers {
    ise = {
      source  = "ciscodevnet/ise"
      version = ">= 0.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.3"
    }
    utils = {
      source  = "netascode/utils"
      version = ">= 0.2.5"
    }
  }
}
