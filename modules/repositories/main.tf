resource "ise_repository" "repository" {

  for_each = var.repositories

  name        = each.key
  enable_pki  = try(each.value.enable_pki, var.repositories_defaults.enable_pki, null)
  password    = try(each.value.password, var.repositories_defaults.password, null)
  path        = try(each.value.path, var.repositories_defaults.path, null)
  protocol    = try(each.value.protocol, var.repositories_defaults.protocol, null)
  server_name = try(each.value.server_name, var.repositories_defaults.server_name, null)
  user_name   = try(each.value.user_name, var.repositories_defaults.user_name, null)
}
