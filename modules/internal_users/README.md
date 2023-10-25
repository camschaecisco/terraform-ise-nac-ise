# Terraform Cisco ISE Network Access Users Module

Manages User Identity Groups

Location in GUI:

`Administration` » `Identity Management` » `Users` » `Network Access Users`
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
| [ise_internal_user.internal_users](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/internal_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_user_identity_groups"></a> [all\_user\_identity\_groups](#input\_all\_user\_identity\_groups) | All User Identity Groups map | `map(any)` | n/a | yes |
| <a name="input_internal_users"></a> [internal\_users](#input\_internal\_users) | Network Access User | `any` | n/a | yes |
| <a name="input_internal_users_defaults"></a> [internal\_users\_defaults](#input\_internal\_users\_defaults) | Network Access User Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Internal User Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
