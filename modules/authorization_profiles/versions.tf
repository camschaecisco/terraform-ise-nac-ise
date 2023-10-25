terraform {
  required_version = ">= 1.6.0"

  required_providers {
    ise = {
      source  = "CiscoDevNet/ise"
      version = "0.1.3"
    }
  }
}
