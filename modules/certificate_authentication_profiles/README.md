# Terraform Cisco ISE Certificate Authentication Profiles Module

Manages Certificate Authentication Profiles

Location in GUI:

`Administration` » `Identity Management` » `External Identity Sources` » `Certificate Authentication Profile`

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
| [ise_certificate_authentication_profile.cap](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/certificate_authentication_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authentication_profiles"></a> [certificate\_authentication\_profiles](#input\_certificate\_authentication\_profiles) | Certificate Authentication Profiles | `any` | n/a | yes |
| <a name="input_certificate_authentication_profiles_defaults"></a> [certificate\_authentication\_profiles\_defaults](#input\_certificate\_authentication\_profiles\_defaults) | Certificate Authentication Profiles Defaults | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Certificate Authentication Profile Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
