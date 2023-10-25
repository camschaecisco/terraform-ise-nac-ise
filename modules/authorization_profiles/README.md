# Terraform Cisco ISE Authorization Profile Module

Manages Authorization Profiles

Location in GUI:

`Policy` » `Policy Elements` » `Results` » `Authorization` » `Authorization Profiles`

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
| [ise_authorization_profile.authorization_profiles](https://registry.terraform.io/providers/CiscoDevNet/ise/0.1.3/docs/resources/authorization_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorization_profiles"></a> [authorization\_profiles](#input\_authorization\_profiles) | Authorization Profiles | `any` | n/a | yes |
| <a name="input_authorization_profiles_defaults"></a> [authorization\_profiles\_defaults](#input\_authorization\_profiles\_defaults) | Authorization Profiles Defaults | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Authz Profile Name to ID mapping, example: 'EXAMPLE' = 'ddabeafa-0367-4af2-9fe0-a6eb4c436164' |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
