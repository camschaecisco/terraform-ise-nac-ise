# Terraform Cisco ISE Network Access - Authorization Policy Module

Manages Network Access Authorization Policies

Location in GUI:

`Policy` » `Policy Sets` » `View` » `Authorization Policy`

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
| [ise_network_access_authorization_rule.authorization_policies](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/network_access_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_policy_sets"></a> [all\_policy\_sets](#input\_all\_policy\_sets) | All Policy Sets map | `map(any)` | `null` | no |
| <a name="input_authorization_policies"></a> [authorization\_policies](#input\_authorization\_policies) | Authorization Policies | `any` | n/a | yes |
| <a name="input_authorization_policies_defaults"></a> [authorization\_policies\_defaults](#input\_authorization\_policies\_defaults) | Authorization Policies Defaults | `any` | n/a | yes |
| <a name="input_authorization_profiles"></a> [authorization\_profiles](#input\_authorization\_profiles) | Authoriation Profiles Map | `map(any)` | `null` | no |
| <a name="input_conditions_data"></a> [conditions\_data](#input\_conditions\_data) | Conditions Data | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_conditions"></a> [conditions](#output\_conditions) | n/a |
| <a name="output_ids"></a> [ids](#output\_ids) | Authz Policy Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
