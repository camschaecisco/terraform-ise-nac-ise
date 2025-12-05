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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ise"></a> [ise](#module\_ise) | netascode/nac-ise/ise | >= 0.1.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.

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
