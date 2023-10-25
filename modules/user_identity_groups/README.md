# Terraform Cisco ISE User Identity Group Module

Manages User Identity Groups

Location in GUI:

`Administration` » `Identity Management` » `Groups` » `User Identity Groups`
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
| [ise_user_identity_group.user_identity_groups](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/user_identity_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_user_identity_groups"></a> [user\_identity\_groups](#input\_user\_identity\_groups) | User Identity Groups | `any` | n/a | yes |
| <a name="input_user_identity_groups_defaults"></a> [user\_identity\_groups\_defaults](#input\_user\_identity\_groups\_defaults) | User Identity Groups Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | User Identity Group Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
