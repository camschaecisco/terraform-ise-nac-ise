# Terraform Cisco ISE Endpoint Identity Group Module

Manages Endpoint Identity Groups

Location in GUI:

`Administration` » `Identity Management` » `Groups` » `Identity Groups` » `Endpoint Identity Groups`

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
| [ise_endpoint_identity_group.endpoint_identity_groups](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/endpoint_identity_group) | resource |
| [ise_endpoint_identity_group.endpoint_identity_groups](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/data-sources/endpoint_identity_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint_identity_groups"></a> [endpoint\_identity\_groups](#input\_endpoint\_identity\_groups) | Endpoint Identity Groups | `any` | n/a | yes |
| <a name="input_endpoint_identity_groups_defaults"></a> [endpoint\_identity\_groups\_defaults](#input\_endpoint\_identity\_groups\_defaults) | Endpoint Identity Groups Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Endpoint Identity Group Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
