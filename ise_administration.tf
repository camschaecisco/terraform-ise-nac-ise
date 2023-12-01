resource "ise_repository" "repository" {
  for_each = { for repository in try(local.ise.administration.repositories, []) : repository.name => repository if var.manage_administration }

  name        = each.key
  enable_pki  = try(each.value.enable_pki, local.defaults.ise.administration.repositories.enable_pki, null)
  password    = try(each.value.password, local.defaults.ise.administration.repositories.password, null)
  path        = try(each.value.path, local.defaults.ise.administration.repositories.path, null)
  protocol    = try(each.value.protocol, local.defaults.ise.administration.repositories.protocol, null)
  server_name = try(each.value.server_name, local.defaults.ise.administration.repositories.server_name, null)
  user_name   = try(each.value.user_name, local.defaults.ise.administration.repositories.user_name, null)
}
