# Terraform Cisco ISE Network Access - Conditions Module

Manages Network Access Conditions

Location in GUI:

`Policy` » `Policy Elements` » `Conditions`
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_ise"></a> [ise](#requirement\_ise) | 0.1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ise"></a> [ise](#provider\_ise) | 0.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ise_network_access_condition.conditions](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/network_access_condition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_access_conditions"></a> [network\_access\_conditions](#input\_network\_access\_conditions) | Network Access Conditions | `any` | n/a | yes |
| <a name="input_network_access_conditions_defaults"></a> [network\_access\_conditions\_defaults](#input\_network\_access\_conditions\_defaults) | Network Access Conditions Defaults | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Condition Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
