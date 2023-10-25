# Terraform Cisco ISE Network Access - Policy Sets Module

Manages Network Access Policy Sets

Location in GUI:

`Policy` » `Policy Sets`
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
| [ise_network_access_policy_set.policy_sets](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/network_access_policy_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_conditions_data"></a> [conditions\_data](#input\_conditions\_data) | Conditions Data | `any` | n/a | yes |
| <a name="input_policy_sets"></a> [policy\_sets](#input\_policy\_sets) | Policy Sets | `any` | n/a | yes |
| <a name="input_policy_sets_defaults"></a> [policy\_sets\_defaults](#input\_policy\_sets\_defaults) | Policy Sets Defaults | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Map |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
