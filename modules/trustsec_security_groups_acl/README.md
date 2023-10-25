# Terraform Cisco ISE TrustSec Security Group ACL Module

Manages TrustSec Security Group ACL

Location in GUI:

Security Group ACLs
`Work Center` » `TrustSec` » `Components` » `Security Group ACLs`

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
| [ise_trustsec_security_group_acl.sg_acl](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/trustsec_security_group_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_groups_acl"></a> [security\_groups\_acl](#input\_security\_groups\_acl) | Security Groups ACL | `any` | n/a | yes |
| <a name="input_security_groups_acl_defaults"></a> [security\_groups\_acl\_defaults](#input\_security\_groups\_acl\_defaults) | Security Groups ACL Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Security Group ACL Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
