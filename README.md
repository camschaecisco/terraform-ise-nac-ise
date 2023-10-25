<!-- BEGIN_TF_DOCS -->
# Terraform Network-as-Code Cisco ISE Module
A Terraform module to configure Cisco ISE.
## Usage
This module supports an inventory driven approach, where a complete ISE configuration or parts of it are either modeled in one or more YAML files or natively using Terraform variables.
The full data model documentation is available here: https://ise-as-code.cisco.com/data_model/overview/
## Examples
Configuring a Network Access Condition using YAML:
#### `network_access_condition.yaml`
```yaml
---
ise:
  policy:
    policy_elements:
      network_access_conditions:
        - name: CertificateNotExpired
          condition_type: LibraryConditionAttributes
          is_negate: false
          dictionary_name: CERTIFICATE
          attribute_name: Is Expired
          operator: equals
          dictionary_value: null
          attribute_value: "False"
          description: null
```
#### `main.tf`
```hcl
module "ise" {
  source = "git::https://wwwin-github.cisco.com/netascode/terraform-ise-nac-ise.git?ref=master"

  yaml_files = ["network_access_condition.yaml"]
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_ise"></a> [ise](#requirement\_ise) | >= 0.1.3 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.2.5 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_model"></a> [model](#input\_model) | As an alternative to YAML files, a native Terraform data structure can be provided as well. | `map(any)` | `{}` | no |
| <a name="input_yaml_directories"></a> [yaml\_directories](#input\_yaml\_directories) | List of paths to YAML directories. | `list(string)` | `[]` | no |
| <a name="input_yaml_files"></a> [yaml\_files](#input\_yaml\_files) | List of paths to YAML files. | `list(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_values"></a> [default\_values](#output\_default\_values) | All default values. |
| <a name="output_model"></a> [model](#output\_model) | Full model. |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_ise"></a> [ise](#provider\_ise) | 0.1.3 |
| <a name="provider_utils"></a> [utils](#provider\_utils) | 0.2.5 |
## Resources

| Name | Type |
|------|------|
| [ise_network_access_condition.conditions](https://registry.terraform.io/providers/CiscoDevNet/ise/latest/docs/data-sources/network_access_condition) | data source |
| [utils_yaml_merge.defaults](https://registry.terraform.io/providers/netascode/utils/latest/docs/data-sources/yaml_merge) | data source |
| [utils_yaml_merge.model](https://registry.terraform.io/providers/netascode/utils/latest/docs/data-sources/yaml_merge) | data source |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_allowed_protocols"></a> [allowed\_protocols](#module\_allowed\_protocols) | ./modules/allowed_protocols | n/a |
| <a name="module_authentication_policies"></a> [authentication\_policies](#module\_authentication\_policies) | ./modules/authentication_policies | n/a |
| <a name="module_authorization_policies"></a> [authorization\_policies](#module\_authorization\_policies) | ./modules/authorization_policies | n/a |
| <a name="module_authorization_profiles"></a> [authorization\_profiles](#module\_authorization\_profiles) | ./modules/authorization_profiles | n/a |
| <a name="module_certificate_authentication_profiles"></a> [certificate\_authentication\_profiles](#module\_certificate\_authentication\_profiles) | ./modules/certificate_authentication_profiles | n/a |
| <a name="module_endpoint_identity_groups"></a> [endpoint\_identity\_groups](#module\_endpoint\_identity\_groups) | ./modules/endpoint_identity_groups | n/a |
| <a name="module_internal_users"></a> [internal\_users](#module\_internal\_users) | ./modules/internal_users | n/a |
| <a name="module_network_access_conditions"></a> [network\_access\_conditions](#module\_network\_access\_conditions) | ./modules/network_access_conditions | n/a |
| <a name="module_policy_sets"></a> [policy\_sets](#module\_policy\_sets) | ./modules/policy_sets | n/a |
| <a name="module_repositories"></a> [repositories](#module\_repositories) | ./modules/repositories | n/a |
| <a name="module_trustsec_matrix"></a> [trustsec\_matrix](#module\_trustsec\_matrix) | ./modules/trustsec_matrix | n/a |
| <a name="module_trustsec_security_groups"></a> [trustsec\_security\_groups](#module\_trustsec\_security\_groups) | ./modules/trustsec_security_groups | n/a |
| <a name="module_trustsec_security_groups_acl"></a> [trustsec\_security\_groups\_acl](#module\_trustsec\_security\_groups\_acl) | ./modules/trustsec_security_groups_acl | n/a |
| <a name="module_user_identity_groups"></a> [user\_identity\_groups](#module\_user\_identity\_groups) | ./modules/user_identity_groups | n/a |
<!-- END_TF_DOCS -->