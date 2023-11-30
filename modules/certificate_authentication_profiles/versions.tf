terraform {
  required_version = ">= 1.3.0"

  required_providers {
    ise = {
      source  = "CiscoDevNet/ise"
      version = "0.1.3"
    }
  }
}
