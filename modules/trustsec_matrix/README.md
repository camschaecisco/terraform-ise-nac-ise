# Terraform Cisco ISE TrustSec Egress Policy Matrix Module

Manages TrustSec Egress Policy Matrix

Location in GUI:

TrustSec Egress Policy Matrix
`Work Center` » `TrustSec` » `TrustSec Policy` » `Egress Policy` » `Matrix`

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
| [ise_trustsec_egress_matrix_cell.matrix](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/trustsec_egress_matrix_cell) | resource |
| [ise_trustsec_security_group.security_groups](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/data-sources/trustsec_security_group) | data source |
| [ise_trustsec_security_group_acl.security_groups_acl](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/data-sources/trustsec_security_group_acl) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_groups_acl_ids"></a> [security\_groups\_acl\_ids](#input\_security\_groups\_acl\_ids) | Security Groups ACL IDs | `map(any)` | n/a | yes |
| <a name="input_security_groups_ids"></a> [security\_groups\_ids](#input\_security\_groups\_ids) | Security Groups IDs | `map(any)` | n/a | yes |
| <a name="input_trustsec_matrix"></a> [trustsec\_matrix](#input\_trustsec\_matrix) | Trustsec Egress Matrix | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | TrustSec Egress Matrix Cell Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
