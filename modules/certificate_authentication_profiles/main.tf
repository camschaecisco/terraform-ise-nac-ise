resource "ise_certificate_authentication_profile" "cap" {
  for_each = var.certificate_authentication_profiles

  name                         = each.key
  description                  = try(each.value.description, var.certificate_authentication_profiles_defaults.description, null)
  allowed_as_user_name         = try(each.value.allowed_as_user_name, var.certificate_authentication_profiles_defaults.description, null)
  certificate_attribute_name   = try(each.value.certificate_attribute_name, var.certificate_authentication_profiles_defaults.description, null)
  external_identity_store_name = try(each.value.external_identity_store_name, var.certificate_authentication_profiles_defaults.description, null)
  match_mode                   = try(each.value.match_mode, var.certificate_authentication_profiles_defaults.description, null)
  username_from                = try(each.value.username_from, var.certificate_authentication_profiles_defaults.description, null)
}
