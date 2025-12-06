<!-- BEGIN_TF_DOCS -->
# ISE Terraform Module with 7-Level Nesting Support



## Overview

This Terraform module manages Cisco ISE (Identity Services Engine) configurations with support for up to 7-level nested conditions. The module follows Network as Code principles with multi-device support, configuration hierarchy, and conditional deployment.

## Features

- **7-Level Nesting Support**: Full schema support for 7-level nested conditions (Note: Terraform Framework currently limits to 5 levels)
- **Multi-Device Management**: Configure multiple ISE instances from a single module
- **Configuration Hierarchy**: Fallback logic with defaults and device-specific overrides
- **Conditional Deployment**: Support for full, incremental, and validate modes
- **Comprehensive Resource Coverage**: All 10 ISE authorization and authentication resources

## Usage

```hcl
module "ise" {
  source = "./terraform-ise-nac-ise"

  model = yamldecode(file("ise-config.yaml"))

  devices = [
    {
      name     = "ise-primary"
      url      = "https://ise1.example.com"
      username = var.ise_username
      password = var.ise_password
    }
  ]

  deploy_mode = "full"
  enable_7_level_nesting = false  # Set to true when framework supports it
}
```

## Nesting Levels

The module supports the following nesting structure:
- Level 1: Root condition
- Level 2-6: Any condition type (ConditionAndBlock, ConditionOrBlock, ConditionAttributes, ConditionReference)
- Level 7: Terminal level - only ConditionAttributes or ConditionReference

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_ise"></a> [ise](#requirement\_ise) | >= 0.1.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.2.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ise"></a> [ise](#provider\_ise) | 0.2.12 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.6.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.13.1 |
| <a name="provider_utils"></a> [utils](#provider\_utils) | 1.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ise_allowed_protocols.allowed_protocols](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/allowed_protocols) | resource |
| [ise_allowed_protocols_tacacs.allowed_protocols_tacacs](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/allowed_protocols_tacacs) | resource |
| [ise_authorization_profile.authorization_profile](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/authorization_profile) | resource |
| [ise_certificate_authentication_profile.certificate_authentication_profile](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/certificate_authentication_profile) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authentication_rule.device_admin_authentication_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authentication_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_exception_rule.device_admin_authorization_exception_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_global_exception_rule.device_admin_authorization_global_exception_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_global_exception_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_authorization_rule.device_admin_authorization_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_authorization_rule) | resource |
| [ise_device_admin_condition.device_admin_condition](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_condition) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_policy_set.device_admin_policy_set_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_policy_set) | resource |
| [ise_device_admin_time_and_date_condition.device_admin_time_and_date_condition](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/device_admin_time_and_date_condition) | resource |
| [ise_downloadable_acl.downloadable_acl](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/downloadable_acl) | resource |
| [ise_endpoint_identity_group.endpoint_identity_group](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/endpoint_identity_group) | resource |
| [ise_internal_user.internal_user](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/internal_user) | resource |
| [ise_license_tier_state.license_tier_state](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/license_tier_state) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authentication_rule.network_access_authentication_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authentication_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_exception_rule.network_access_authorization_exception_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_global_exception_rule.network_access_authorization_global_exception_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_global_exception_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_authorization_rule.network_access_authorization_rule_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_authorization_rule) | resource |
| [ise_network_access_condition.network_access_condition](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_condition) | resource |
| [ise_network_access_dictionary.network_access_dictionary](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_dictionary) | resource |
| [ise_network_access_policy_set.network_access_policy_set_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_10](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_11](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_12](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_13](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_14](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_15](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_16](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_17](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_18](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_19](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_6](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_7](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_8](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_policy_set.network_access_policy_set_9](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_policy_set) | resource |
| [ise_network_access_time_and_date_condition.network_access_time_and_date_condition](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_access_time_and_date_condition) | resource |
| [ise_network_device.network_device](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device) | resource |
| [ise_network_device_group.network_device_group_0](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device_group) | resource |
| [ise_network_device_group.network_device_group_1](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device_group) | resource |
| [ise_network_device_group.network_device_group_2](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device_group) | resource |
| [ise_network_device_group.network_device_group_3](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device_group) | resource |
| [ise_network_device_group.network_device_group_4](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device_group) | resource |
| [ise_network_device_group.network_device_group_5](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/network_device_group) | resource |
| [ise_repository.repository](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/repository) | resource |
| [ise_tacacs_command_set.tacacs_command_set](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/tacacs_command_set) | resource |
| [ise_tacacs_profile.tacacs_profile](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/tacacs_profile) | resource |
| [ise_trustsec_egress_matrix_cell.trustsec_egress_matrix_cell](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/trustsec_egress_matrix_cell) | resource |
| [ise_trustsec_ip_to_sgt_mapping.trustsec_ip_to_sgt_mapping](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/trustsec_ip_to_sgt_mapping) | resource |
| [ise_trustsec_ip_to_sgt_mapping_group.trustsec_ip_to_sgt_mapping_group](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/trustsec_ip_to_sgt_mapping_group) | resource |
| [ise_trustsec_security_group.trustsec_security_group](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/trustsec_security_group) | resource |
| [ise_trustsec_security_group_acl.trustsec_security_group_acl](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/trustsec_security_group_acl) | resource |
| [ise_user_identity_group.user_identity_group](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/resources/user_identity_group) | resource |
| [local_sensitive_file.defaults](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [time_sleep.device_admin_policy_object_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.network_device_group_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.sgt_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [ise_device_admin_condition.device_admin_condition](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/device_admin_condition) | data source |
| [ise_device_admin_condition.device_admin_condition_circular](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/device_admin_condition) | data source |
| [ise_endpoint_identity_group.endpoint_identity_group](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/endpoint_identity_group) | data source |
| [ise_network_access_condition.network_access_condition](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/network_access_condition) | data source |
| [ise_network_access_condition.network_access_condition_circular](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/network_access_condition) | data source |
| [ise_trustsec_security_group.trustsec_security_group](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/trustsec_security_group) | data source |
| [ise_trustsec_security_group_acl.trustsec_security_group_acl](https://registry.terraform.io/providers/ciscodevnet/ise/latest/docs/data-sources/trustsec_security_group_acl) | data source |
| [utils_yaml_merge.defaults](https://registry.terraform.io/providers/netascode/utils/latest/docs/data-sources/yaml_merge) | data source |
| [utils_yaml_merge.model](https://registry.terraform.io/providers/netascode/utils/latest/docs/data-sources/yaml_merge) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_file"></a> [config\_file](#input\_config\_file) | Path to the YAML configuration file | `string` | `""` | no |
| <a name="input_defaults"></a> [defaults](#input\_defaults) | Default values for ISE configuration with fallback hierarchy | `any` | <pre>{<br/>  "ise": {<br/>    "configuration": {<br/>      "conditions": {<br/>        "max_nesting_level": 7,<br/>        "terminal_level_types": [<br/>          "ConditionAttributes",<br/>          "ConditionReference"<br/>        ]<br/>      },<br/>      "device_admin": {<br/>        "authentication_rules": {<br/>          "default": false,<br/>          "rank": 9999,<br/>          "state": "enabled"<br/>        },<br/>        "authorization_rules": {<br/>          "default": false,<br/>          "rank": 9999,<br/>          "state": "enabled"<br/>        },<br/>        "policy_sets": {<br/>          "default": false,<br/>          "rank": 9999,<br/>          "state": "enabled"<br/>        }<br/>      },<br/>      "network_access": {<br/>        "authentication_rules": {<br/>          "default": false,<br/>          "rank": 9999,<br/>          "state": "enabled"<br/>        },<br/>        "authorization_rules": {<br/>          "default": false,<br/>          "rank": 9999,<br/>          "state": "enabled"<br/>        },<br/>        "policy_sets": {<br/>          "default": false,<br/>          "rank": 9999,<br/>          "state": "enabled"<br/>        }<br/>      }<br/>    }<br/>  }<br/>}</pre> | no |
| <a name="input_deploy_mode"></a> [deploy\_mode](#input\_deploy\_mode) | Deployment mode for the configuration (full, incremental, validate) | `string` | `"full"` | no |
| <a name="input_devices"></a> [devices](#input\_devices) | List of ISE devices to configure | <pre>list(object({<br/>    name     = string<br/>    url      = string<br/>    username = string<br/>    password = string<br/>    insecure = optional(bool, true)<br/>    retries  = optional(number, 3)<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_7_level_nesting"></a> [enable\_7\_level\_nesting](#input\_enable\_7\_level\_nesting) | Enable 7-level nesting support (Note: Terraform Framework currently limits to 5 levels) | `bool` | `false` | no |
| <a name="input_manage_device_administration"></a> [manage\_device\_administration](#input\_manage\_device\_administration) | Manage Device Administration configuration | `bool` | `true` | no |
| <a name="input_manage_identity_management"></a> [manage\_identity\_management](#input\_manage\_identity\_management) | Manage Identity Management configuration | `bool` | `true` | no |
| <a name="input_manage_network_access"></a> [manage\_network\_access](#input\_manage\_network\_access) | Manage Network Access configuration | `bool` | `true` | no |
| <a name="input_manage_network_resources"></a> [manage\_network\_resources](#input\_manage\_network\_resources) | Manage Network Resources configuration | `bool` | `true` | no |
| <a name="input_manage_system"></a> [manage\_system](#input\_manage\_system) | Manage System configuration | `bool` | `true` | no |
| <a name="input_manage_trust_sec"></a> [manage\_trust\_sec](#input\_manage\_trust\_sec) | Manage TrustSec configuration | `bool` | `false` | no |
| <a name="input_model"></a> [model](#input\_model) | The ISE YAML model configuration | `any` | `{}` | no |
| <a name="input_write_default_values_file"></a> [write\_default\_values\_file](#input\_write\_default\_values\_file) | Write all default values to a specified file | `string` | `""` | no |
| <a name="input_yaml_directories"></a> [yaml\_directories](#input\_yaml\_directories) | List of directories containing YAML files | `set(string)` | `[]` | no |
| <a name="input_yaml_files"></a> [yaml\_files](#input\_yaml\_files) | List of YAML files | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_values"></a> [default\_values](#output\_default\_values) | All default values. |
| <a name="output_model"></a> [model](#output\_model) | Full model. |

## Examples

See the `examples/` directory for complete configuration examples including:
- Basic 5-level nesting (current limit)
- Full 7-level nesting (future capability)
- Multi-device configurations
- Complex authorization rules

## Known Limitations

- Terraform Plugin Framework v1.16.1 currently enforces a 5-level nesting limit
- Use condition references as a workaround for deeper nesting requirements

<!-- END_TF_DOCS -->