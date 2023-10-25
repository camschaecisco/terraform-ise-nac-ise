# Terraform Cisco ISE TrustSec Security Group Module

Manages TrustSec Security Group

Location in GUI:

Security Groups:
`Work Center` » `TrustSec` » `Components` » `Security Groups`

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
| [ise_trustsec_security_group.security_groups](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/trustsec_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Security Groups | `any` | n/a | yes |
| <a name="input_security_groups_defaults"></a> [security\_groups\_defaults](#input\_security\_groups\_defaults) | Security Groups Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Security Group Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
