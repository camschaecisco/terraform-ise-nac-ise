resource "ise_authorization_profile" "authorization_profiles" {
  for_each = var.authorization_profiles

  name                                                  = each.key
  description                                           = try(each.value.description, var.authorization_profiles_defaults.description, null)
  vlan_name_id                                          = try(each.value.vlan_name_id, var.authorization_profiles_defaults.vlan_name_id, null)
  vlan_tag_id                                           = try(each.value.vlan_tag_id, var.authorization_profiles_defaults.vlan_tag_id, null)
  web_redirection_type                                  = try(each.value.web_redirection_type, var.authorization_profiles_defaults.web_redirection_type, null)
  web_redirection_acl                                   = try(each.value.web_redirection_acl, var.authorization_profiles_defaults.web_redirection_acl, null)
  web_redirection_portal_name                           = try(each.value.web_redirection_portal_name, var.authorization_profiles_defaults.web_redirection_portal_name, null)
  web_redirection_static_ip_host_name_fqdn              = try(each.value.web_redirection_static_ip_host_name_fqdn, var.authorization_profiles_defaults.web_redirection_static_ip_host_name_fqdn, null)
  web_redirection_display_certificates_renewal_messages = try(each.value.web_redirection_display_certificates_renewal_messages, var.authorization_profiles_defaults.web_redirection_display_certificates_renewal_messages, null)
  agentless_posture                                     = try(each.value.agentless_posture, var.authorization_profiles_defaults.agentless_posture, null)
  access_type                                           = try(each.value.access_type, var.authorization_profiles_defaults.access_type, null)
  profile_name                                          = try(each.value.profile_name, var.authorization_profiles_defaults.profile_name, null)
  airespace_acl                                         = try(each.value.airespace_acl, var.authorization_profiles_defaults.airespace_acl, null)
  acl                                                   = try(each.value.acl, var.authorization_profiles_defaults.acl, null)
  auto_smart_port                                       = try(each.value.auto_smart_port, var.authorization_profiles_defaults.auto_smart_port, null)
  interface_template                                    = try(each.value.interface_template, var.authorization_profiles_defaults.interface_template, null)
  ipv6_acl_filter                                       = try(each.value.ipv6_acl_filter, var.authorization_profiles_defaults.ipv6_acl_filter, null)
  avc_profile                                           = try(each.value.avc_profile, var.authorization_profiles_defaults.avc_profile, null)
  asa_vpn                                               = try(each.value.asa_vpn, var.authorization_profiles_defaults.asa_vpn, null)
  unique_identifier                                     = try(each.value.unique_identifier, var.authorization_profiles_defaults.unique_identifier, null)
  track_movement                                        = try(each.value.track_movement, var.authorization_profiles_defaults.track_movement, null)
  service_template                                      = try(each.value.service_template, var.authorization_profiles_defaults.service_template, null)
  easywired_session_candidate                           = try(each.value.easywired_session_candidate, var.authorization_profiles_defaults.easywired_session_candidate, null)
  voice_domain_permission                               = try(each.value.voice_domain_permission, var.authorization_profiles_defaults.voice_domain_permission, null)
  neat                                                  = try(each.value.neat, var.authorization_profiles_defaults.neat, null)
  web_auth                                              = try(each.value.web_auth, var.authorization_profiles_defaults.web_auth, null)
  mac_sec_policy                                        = try(each.value.mac_sec_policy, var.authorization_profiles_defaults.mac_sec_policy, null)
  reauthentication_connectivity                         = try(each.value.reauthentication_connectivity, var.authorization_profiles_defaults.reauthentication_connectivity, null)
  reauthentication_timer                                = try(each.value.reauthentication_timer, var.authorization_profiles_defaults.reauthentication_timer, null)
  airespace_ipv6_acl                                    = try(each.value.airespace_ipv6_acl, var.authorization_profiles_defaults.airespace_ipv6_acl, null)
  advanced_attributes = try([for i in each.value.advanced_attributes : {
    attribute_1_value_type      = "AdvancedDictionaryAttribute"
    attribute_1_dictionary_name = try(split(":", i.dictionary)[0], null)
    attribute_1_name            = try(split(":", i.dictionary)[1], null)
    attribute_2_value_type      = "AttributeValue"
    attribute_2_value           = try(i.attribute_value, null)
  }], null)

  lifecycle {
    create_before_destroy = true
  }
}
