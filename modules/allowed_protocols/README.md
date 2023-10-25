# Terraform Cisco ISE Allowed Protocols Module

Manages create, read, update and delete operations on AllowedProtocols

Location in GUI:

`Policy` » `Policy Elements` » `Results` » `Authentication` » `Allowed Protocols`

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
| [ise_allowed_protocols.allowed_protocols](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/allowed_protocols) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_protocols"></a> [allowed\_protocols](#input\_allowed\_protocols) | Allowed Protocols | `any` | n/a | yes |
| <a name="input_allowed_protocols_defaults"></a> [allowed\_protocols\_defaults](#input\_allowed\_protocols\_defaults) | Allowed Protocols Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Allowed Protocol Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
