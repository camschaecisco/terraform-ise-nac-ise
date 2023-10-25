module "ise" {
  source = "git::https://wwwin-github.cisco.com/netascode/terraform-ise-nac-ise.git?ref=master"

  yaml_files = ["network_access_condition.yaml"]
}
