resource "ise_allowed_protocols" "allowed_protocols" {
  for_each = { for protocol in try(local.ise.policy.policy_elements.allowed_protocols, []) : protocol.name => protocol if var.manage_policy }

  description                                       = try(each.value.description, "")
  name                                              = each.key
  process_host_lookup                               = try(each.value.process_host_lookup, local.defaults.ise.policy.allowed_protocols.process_host_lookup, null)
  allow_pap_ascii                                   = try(each.value.allow_pap_ascii, local.defaults.ise.policy.allowed_protocols.allow_pap_ascii, null)
  allow_chap                                        = try(each.value.allow_chap, local.defaults.ise.policy.allowed_protocols.allow_chap, null)
  allow_ms_chap_v1                                  = try(each.value.allow_ms_chap_v1, local.defaults.ise.policy.allowed_protocols.allow_ms_chap_v1, null)
  allow_ms_chap_v2                                  = try(each.value.allow_ms_chap_v2, local.defaults.ise.policy.allowed_protocols.allow_ms_chap_v2, null)
  allow_eap_md5                                     = try(each.value.allow_eap_md5, local.defaults.ise.policy.allowed_protocols.allow_eap_md5, null)
  allow_leap                                        = try(each.value.allow_leap, local.defaults.ise.policy.allowed_protocols.allow_leap, null)
  allow_eap_tls                                     = try(each.value.allow_eap_tls, local.defaults.ise.policy.allowed_protocols.allow_eap_tls, null)
  allow_eap_ttls                                    = try(each.value.allow_eap_ttls, local.defaults.ise.policy.allowed_protocols.allow_eap_ttls, null)
  allow_eap_fast                                    = try(each.value.allow_eap_fast, local.defaults.ise.policy.allowed_protocols.allow_eap_fast, null)
  allow_peap                                        = try(each.value.allow_peap, local.defaults.ise.policy.allowed_protocols.allow_peap, null)
  allow_teap                                        = try(each.value.allow_teap, local.defaults.ise.policy.allowed_protocols.allow_teap, null)
  allow_5g                                          = try(each.value.five_g, local.defaults.ise.policy.allowed_protocols.five_g, null)
  allow_preferred_eap_protocol                      = try(each.value.allow_preferred_eap_protocol, local.defaults.ise.policy.allowed_protocols.allow_preferred_eap_protocol, null)
  eap_tls_l_bit                                     = try(each.value.eap_tls_l_bit, local.defaults.ise.policy.allowed_protocols.eap_tls_l_bit, null)
  allow_weak_ciphers_for_eap                        = try(each.value.allow_weak_ciphers_for_eap, local.defaults.ise.policy.allowed_protocols.allow_weak_ciphers_for_eap, null)
  require_message_auth                              = try(each.value.require_message_auth, local.defaults.ise.policy.allowed_protocols.require_message_auth, null)
  eap_tls_allow_auth_of_expired_certs               = try(each.value.eap_tls.allow_eap_tls_auth_of_expired_certs, local.defaults.ise.policy.allowed_protocols.eap_tls.allow_eap_tls_auth_of_expired_certs, null)
  eap_tls_enable_stateless_session_resume           = try(each.value.eap_tls.eap_tls_enable_stateless_session_resume, local.defaults.ise.policy.allowed_protocols.eap_tls.eap_tls_enable_stateless_session_resume, null)
  eap_ttls_pap_ascii                                = try(each.value.eap_ttls.eap_ttls_pap_ascii, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_pap_ascii, null)
  eap_ttls_chap                                     = try(each.value.eap_ttls.eap_ttls_chap, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_chap, null)
  eap_ttls_ms_chap_v1                               = try(each.value.eap_ttls.eap_ttls_ms_chap_v1, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_ms_chap_v1, null)
  eap_ttls_ms_chap_v2                               = try(each.value.eap_ttls.eap_ttls_ms_chap_v2, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_ms_chap_v2, null)
  eap_ttls_eap_md5                                  = try(each.value.eap_ttls.eap_ttls_eap_md5, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_eap_md5, null)
  eap_ttls_eap_ms_chap_v2                           = try(each.value.eap_ttls.eap_ttls_eap_ms_chap_v2, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_eap_ms_chap_v2, null)
  eap_ttls_eap_ms_chap_v2_pwd_change                = try(each.value.eap_ttls.eap_ttls_eap_ms_chap_v2_pwd_change, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_eap_ms_chap_v2_pwd_change, null)
  eap_ttls_eap_ms_chap_v2_pwd_change_retries        = try(each.value.eap_ttls.eap_ttls_eap_ms_chap_v2_pwd_change_retries, local.defaults.ise.policy.allowed_protocols.eap_ttls.eap_ttls_eap_ms_chap_v2_pwd_change_retries, null)
  eap_fast_eap_ms_chap_v2                           = try(each.value.eap_fast.allow_eap_fast_eap_ms_chap_v2, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_ms_chap_v2, null)
  eap_fast_eap_ms_chap_v2_pwd_change                = try(each.value.eap_fast.allow_eap_fast_eap_ms_chap_v2_pwd_change, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_ms_chap_v2_pwd_change, null)
  eap_fast_eap_ms_chap_v2_pwd_change_retries        = try(each.value.eap_fast.allow_eap_fast_eap_ms_chap_v2_pwd_change_retries, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_ms_chap_v2_pwd_change_retries, null)
  eap_fast_eap_gtc                                  = try(each.value.eap_fast.allow_eap_fast_eap_gtc, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_gtc, null)
  eap_fast_eap_gtc_pwd_change                       = try(each.value.eap_fast.allow_eap_fast_eap_gtc_pwd_change, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_gtc_pwd_change, null)
  eap_fast_eap_gtc_pwd_change_retries               = try(each.value.eap_fast.allow_eap_fast_eap_gtc_pwd_change_retries, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_gtc_pwd_change_retries, null)
  eap_fast_eap_tls                                  = try(each.value.eap_fast.allow_eap_fast_eap_tls, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_tls, null)
  eap_fast_eap_tls_auth_of_expired_certs            = try(each.value.eap_fast.allow_eap_fast_eap_tls_auth_of_expired_certs, local.defaults.ise.policy.allowed_protocols.eap_fast.allow_eap_fast_eap_tls_auth_of_expired_certs, null)
  eap_fast_use_pacs                                 = try(each.value.eap_fast.eap_fast_use_pacs, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs, null)
  eap_fast_pacs_tunnel_pac_ttl                      = try(each.value.eap_fast.eap_fast_use_pacs_tunnel_pac_ttl, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_tunnel_pac_ttl, null)
  eap_fast_pacs_tunnel_pac_ttl_unit                 = try(each.value.eap_fast.eap_fast_use_pacs_tunnel_pac_ttl_units, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_tunnel_pac_ttl_units, null)
  eap_fast_pacs_use_proactive_pac_update_percentage = try(each.value.eap_fast.eap_fast_use_pacs_use_proactive_pac_update_precentage, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_use_proactive_pac_update_precentage, null)
  eap_fast_pacs_allow_anonymous_provisioning        = try(each.value.eap_fast.eap_fast_use_pacs_allow_anonym_provisioning, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_allow_anonym_provisioning, null)
  eap_fast_pacs_allow_authenticated_provisioning    = try(each.value.eap_fast.eap_fast_use_pacs_allow_authen_provisioning, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_allow_authen_provisioning, null)
  eap_fast_pacs_allow_client_cert                   = try(each.value.eap_fast.eap_fast_use_pacs_accept_client_cert, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_accept_client_cert, null)
  eap_fast_pacs_server_returns                      = try(each.value.eap_fast.eap_fast_use_pacs_server_returns, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_server_returns, null)
  eap_fast_pacs_allow_machine_authentication        = try(each.value.eap_fast.eap_fast_use_pacs_allow_machine_authentication, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_allow_machine_authentication, null)
  eap_fast_pacs_machine_pac_ttl                     = try(each.value.eap_fast.eap_fast_use_pacs_machine_pac_ttl, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_machine_pac_ttl, null)
  eap_fast_pacs_machine_pac_ttl_unit                = try(each.value.eap_fast.eap_fast_use_pacs_machine_pac_ttl_units, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_machine_pac_ttl_units, null)
  eap_fast_pacs_stateless_session_resume            = try(each.value.eap_fast.eap_fast_use_pacs_stateless_session_resume, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_stateless_session_resume, null)
  eap_fast_pacs_authorization_pac_ttl               = try(each.value.eap_fast.eap_fast_use_pacs_authorization_pac_ttl, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_authorization_pac_ttl, null)
  eap_fast_pacs_authorization_pac_ttl_unit          = try(each.value.eap_fast.eap_fast_use_pacs_authorization_pac_ttl_units, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_use_pacs_authorization_pac_ttl_units, null)
  eap_fast_enable_eap_chaining                      = try(each.value.eap_fast.eap_fast_enable_eap_chaining, local.defaults.ise.policy.allowed_protocols.eap_fast.eap_fast_enable_eap_chaining, null)
  teap_eap_ms_chap_v2                               = try(each.value.teap.allow_teap_eap_ms_chap_v2, local.defaults.ise.policy.allowed_protocols.teap.allow_teap_eap_ms_chap_v2, null)
  teap_eap_ms_chap_v2_pwd_change                    = try(each.value.teap.allow_teap_eap_ms_chap_v2_pwd_change, local.defaults.ise.policy.allowed_protocols.teap.allow_teap_eap_ms_chap_v2_pwd_change, null)
  teap_eap_ms_chap_v2_pwd_change_retries            = try(each.value.teap.allow_teap_eap_ms_chap_v2_pwd_change_retries, local.defaults.ise.policy.allowed_protocols.teap.allow_teap_eap_ms_chap_v2_pwd_change_retries, null)
  teap_eap_tls                                      = try(each.value.teap.allow_teap_eap_tls, local.defaults.ise.policy.allowed_protocols.teap.allow_teap_eap_tls, null)
  teap_eap_tls_auth_of_expired_certs                = try(each.value.teap.allow_teap_eap_tls_auth_of_expired_certs, local.defaults.ise.policy.allowed_protocols.teap.allow_teap_eap_tls_auth_of_expired_certs, null)
  teap_eap_accept_client_cert_during_tunnel_est     = try(each.value.teap.accept_client_cert_during_tunnel_est, local.defaults.ise.policy.allowed_protocols.teap.accept_client_cert_during_tunnel_est, null)
  teap_eap_chaining                                 = try(each.value.teap.enable_eap_chaining, local.defaults.ise.policy.allowed_protocols.teap.enable_eap_chaining, null)
  teap_downgrade_msk                                = try(each.value.teap.allow_downgrade_msk, local.defaults.ise.policy.allowed_protocols.teap.allow_downgrade_msk, null)
  preferred_eap_protocol                            = try(each.value.preferred_eap_protocol, local.defaults.ise.policy.allowed_protocols.preferred_eap_protocol, null)
}

resource "ise_authorization_profile" "authorization_profile" {
  for_each = { for profile in try(local.ise.policy.policy_elements.authorization_profiles, []) : profile.name => profile if var.manage_policy }

  name                                                  = each.key
  description                                           = try(each.value.description, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.description, null)
  vlan_name_id                                          = try(each.value.vlan_name_id, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.vlan_name_id, null)
  vlan_tag_id                                           = try(each.value.vlan_tag_id, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.vlan_tag_id, null)
  web_redirection_type                                  = try(each.value.web_redirection_type, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.web_redirection_type, null)
  web_redirection_acl                                   = try(each.value.web_redirection_acl, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.web_redirection_acl, null)
  web_redirection_portal_name                           = try(each.value.web_redirection_portal_name, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.web_redirection_portal_name, null)
  web_redirection_static_ip_host_name_fqdn              = try(each.value.web_redirection_static_ip_host_name_fqdn, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.web_redirection_static_ip_host_name_fqdn, null)
  web_redirection_display_certificates_renewal_messages = try(each.value.web_redirection_display_certificates_renewal_messages, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.web_redirection_display_certificates_renewal_messages, null)
  agentless_posture                                     = try(each.value.agentless_posture, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.agentless_posture, null)
  access_type                                           = try(each.value.access_type, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.access_type, null)
  profile_name                                          = try(each.value.profile_name, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.profile_name, null)
  airespace_acl                                         = try(each.value.airespace_acl, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.airespace_acl, null)
  acl                                                   = try(each.value.acl, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.acl, null)
  auto_smart_port                                       = try(each.value.auto_smart_port, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.auto_smart_port, null)
  interface_template                                    = try(each.value.interface_template, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.interface_template, null)
  ipv6_acl_filter                                       = try(each.value.ipv6_acl_filter, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.ipv6_acl_filter, null)
  avc_profile                                           = try(each.value.avc_profile, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.avc_profile, null)
  asa_vpn                                               = try(each.value.asa_vpn, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.asa_vpn, null)
  unique_identifier                                     = try(each.value.unique_identifier, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.unique_identifier, null)
  track_movement                                        = try(each.value.track_movement, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.track_movement, null)
  service_template                                      = try(each.value.service_template, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.service_template, null)
  easywired_session_candidate                           = try(each.value.easywired_session_candidate, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.easywired_session_candidate, null)
  voice_domain_permission                               = try(each.value.voice_domain_permission, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.voice_domain_permission, null)
  neat                                                  = try(each.value.neat, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.neat, null)
  web_auth                                              = try(each.value.web_auth, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.web_auth, null)
  mac_sec_policy                                        = try(each.value.mac_sec_policy, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.mac_sec_policy, null)
  reauthentication_connectivity                         = try(each.value.reauthentication_connectivity, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.reauthentication_connectivity, null)
  reauthentication_timer                                = try(each.value.reauthentication_timer, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.reauthentication_timer, null)
  airespace_ipv6_acl                                    = try(each.value.airespace_ipv6_acl, local.defaults.ise.policy.allowed_protocolslocal.defaults.ise.policy.authorization_profiles.airespace_ipv6_acl, null)
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

resource "ise_network_access_condition" "network_access_condition" {
  for_each = { for condition in try(local.ise.policy.policy_elements.network_access_conditions, []) : condition.name => condition if var.manage_policy }

  condition_type  = try(each.value.condition_type, local.defaults.ise.policy.network_access_conditions.condition_type, null)
  is_negate       = try(each.value.is_negate, local.defaults.ise.policy.network_access_conditions.is_negate, null)
  attribute_name  = try(each.value.attribute_name, local.defaults.ise.policy.network_access_conditions.attribute_name, null)
  attribute_value = try(each.value.attribute_value, local.defaults.ise.policy.network_access_conditions.attribute_value, null)
  dictionary_name = try(each.value.dictionary_name, local.defaults.ise.policy.network_access_conditions.dictionary_name, null)
  operator        = try(each.value.operator, local.defaults.ise.policy.network_access_conditions.operator, null)
  description     = try(each.value.description, local.defaults.ise.policy.network_access_conditions.description, null)
  name            = each.key
  children        = try(each.value.children, null)
}

locals {
  children_conditions_policy_sets = flatten([
    for value in try(local.ise.policy.policy_sets, []) : flatten([
      for v in try(value.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] :
      [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
    ]) if var.manage_policy
  ])
  conditions_policy_sets = flatten(
    [for v in try(local.ise.policy.policy_sets, []) : try(v.condition.condition_type, null) == "ConditionReference" ? [v.condition.name] : []]
  )
  children_conditions_authz_policies = flatten([
    for value in try(local.ise.policy.authorization_policies, []) : flatten([
      for v in try(value.rule.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] :
      [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
    ]) if var.manage_policy
  ])
  conditions_authz_policies = flatten(
    [for v in try(local.ise.policy.authorization_policies, []) : try(v.rule.condition.condition_type, null) == "ConditionReference" ? [v.rule.condition.name] : [] if var.manage_policy]
  )
  children_conditions_auth_policies = flatten([
    for value in try(local.ise.policy.authentication_policies, []) : flatten([
      for v in try(value.rule.condition.children, []) : try(v.condition_type, null) == "ConditionReference" ? [v.name] :
      [for v2 in try(v.children, []) : try(v2.condition_type, null) == "ConditionReference" ? [v2.name] : []]
    ]) if var.manage_policy
  ])
  conditions_auth_policies = flatten(
    [for v in try(local.ise.policy.authentication_policies, []) : try(v.rule.condition.condition_type, null) == "ConditionReference" ? [v.rule.condition.name] : [] if var.manage_policy]
  )
  unique_conditions  = distinct(concat(local.children_conditions_policy_sets, local.conditions_policy_sets, local.children_conditions_authz_policies, local.conditions_authz_policies, local.children_conditions_auth_policies, local.conditions_auth_policies))
  known_conditions   = [for condition in try(local.ise.policy.policy_elements.network_access_conditions, []) : condition.name]
  unknown_conditions = setsubtract(local.unique_conditions, local.known_conditions)
}

data "ise_network_access_condition" "network_access_condition" {
  for_each = toset(local.unknown_conditions)

  name = each.value
}

resource "ise_network_access_policy_set" "network_access_policy_set" {
  for_each = { for policy in try(local.ise.policy.policy_sets, []) : policy.name => policy if var.manage_policy }

  condition_type            = try(each.value.condition.condition_type, local.defaults.ise.policy.policy_sets.condition.condition_type, null)
  condition_is_negate       = try(each.value.condition.is_negate, local.defaults.ise.policy.policy_sets.condition.is_negate, null)
  condition_attribute_name  = try(each.value.condition.attribute_name, local.defaults.ise.policy.policy_sets.condition.attribute_name, null)
  condition_attribute_value = try(each.value.condition.attribute_value, local.defaults.ise.policy.policy_sets.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.condition.dictionary_name, local.defaults.ise.policy.policy_sets.condition.dictionary_name, null)
  condition_id              = contains(local.known_conditions, try(each.value.condition.name, "")) ? ise_network_access_condition.network_access_condition[each.value.condition.name].id : try(data.ise_network_access_condition.network_access_condition[each.value.condition.name].id, null)
  condition_operator        = try(each.value.condition.operator, local.defaults.ise.policy.policy_sets.condition.operator, null)
  description               = try(each.value.description, local.defaults.ise.policy.policy_sets.description)
  is_proxy                  = try(each.value.is_proxy, local.defaults.ise.policy.policy_sets.is_proxy)
  name                      = each.key
  service_name              = try(each.value.service_name, local.defaults.ise.policy.policy_sets.service_name)
  state                     = try(each.value.state, local.defaults.ise.policy.policy_sets.state)
  rank                      = try(each.value.rank, local.defaults.ise.policy.policy_sets.rank, null)
  children = try([for i in each.value.condition.children : {
    attribute_name   = try(i.attribute_name, null)
    attribute_value  = try(i.attribute_value, null)
    condition_type   = try(i.condition_type, null)
    dictionary_name  = try(i.dictionary_name, null)
    dictionary_value = try(i.dictionary_value, null)
    is_negate        = try(i.is_negate, null)
    operator         = try(i.operator, null)
    id               = contains(local.known_conditions, try(i.name, "")) ? ise_network_access_condition.network_access_condition[i.name].id : try(data.ise_network_access_condition.network_access_condition[i.name].id, null)
    children = try([for j in i.children : {
      attribute_name   = try(j.attribute_name, null)
      attribute_value  = try(j.attribute_value, null)
      condition_type   = try(j.condition_type, null)
      dictionary_name  = try(j.dictionary_name, null)
      dictionary_value = try(j.dictionary_value, null)
      is_negate        = try(j.is_negate, null)
      operator         = try(j.operator, null)
      id               = contains(local.known_conditions, try(j.name, "")) ? ise_network_access_condition.network_access_condition[j.name].id : try(data.ise_network_access_condition.network_access_condition[j.name].id, null)
    }], null)
  }], null)

  depends_on = [ise_authorization_profile.authorization_profile, ise_allowed_protocols.allowed_protocols]
}

resource "ise_network_access_authentication_rule" "network_access_authentication_rule" {
  for_each = { for policy in try(local.ise.policy.authentication_policies, []) : policy.name => policy if var.manage_policy }

  policy_set_id             = ise_network_access_policy_set.network_access_policy_set[each.value.policy_name].id
  name                      = each.key
  rank                      = try(each.value.rule.rank, local.defaults.ise.policy.authentication_policies.rule.rank, null)
  default                   = try(each.value.rule.default, local.defaults.ise.policy.authentication_policies.rule.default, null)
  state                     = try(each.value.rule.state, local.defaults.ise.policy.authentication_policies.rule.state, null)
  condition_type            = try(each.value.rule.condition.condition_type, local.defaults.ise.policy.authentication_policies.rule.condition.condition_type, null)
  condition_id              = contains(local.known_conditions, try(each.value.rule.condition.name, "")) ? ise_network_access_condition.network_access_condition[each.value.rule.condition.name].id : try(data.ise_network_access_condition.network_access_condition[each.value.rule.condition.name].id, null)
  condition_is_negate       = try(each.value.rule.condition.is_negate, local.defaults.ise.policy.authentication_policies.rule.condition.is_negate, null)
  condition_attribute_name  = try(each.value.rule.condition.attribute_name, local.defaults.ise.policy.authentication_policies.rule.condition.attribute_name, null)
  condition_attribute_value = try(each.value.rule.condition.attribute_value, local.defaults.ise.policy.authentication_policies.rule.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.rule.condition.dictionary_name, local.defaults.ise.policy.authentication_policies.rule.condition.dictionary_name, null)
  condition_operator        = try(each.value.rule.condition.operator, local.defaults.ise.policy.authentication_policies.rule.condition.operator, null)
  identity_source_name      = try(each.value.identity_source_name, local.defaults.ise.policy.authentication_policies.identity_source_name, null)
  if_auth_fail              = try(each.value.if_auth_fail, local.defaults.ise.policy.authentication_policies.if_auth_fail, null)
  if_process_fail           = try(each.value.if_process_fail, local.defaults.ise.policy.authentication_policies.if_process_fail, null)
  if_user_not_found         = try(each.value.if_user_not_found, local.defaults.ise.policy.authentication_policies.if_user_not_found, null)

  children = try([for i in each.value.rule.condition.children : {
    attribute_name   = try(i.attribute_name, null)
    attribute_value  = try(i.attribute_value, null)
    condition_type   = try(i.condition_type, null)
    dictionary_name  = try(i.dictionary_name, null)
    dictionary_value = try(i.dictionary_value, null)
    is_negate        = try(i.is_negate, null)
    operator         = try(i.operator, null)
    id               = contains(local.known_conditions, try(i.name, "")) ? ise_network_access_condition.network_access_condition[i.name].id : try(data.ise_network_access_condition.network_access_condition[i.name].id, null)
    children = try([for j in i.children : {
      attribute_name   = try(j.attribute_name, null)
      attribute_value  = try(j.attribute_value, null)
      condition_type   = try(j.condition_type, null)
      dictionary_name  = try(j.dictionary_name, null)
      dictionary_value = try(j.dictionary_value, null)
      is_negate        = try(j.is_negate, null)
      operator         = try(j.operator, null)
      id               = contains(local.known_conditions, try(j.name, "")) ? ise_network_access_condition.network_access_condition[j.name].id : try(data.ise_network_access_condition.network_access_condition[j.name].id, null)
    }], null)
  }], null)
}

resource "ise_network_access_authorization_rule" "network_access_authorization_rule" {
  for_each = { for policy in try(local.ise.policy.authorization_policies, []) : policy.name => policy if var.manage_policy }

  policy_set_id             = ise_network_access_policy_set.network_access_policy_set[each.value.policy_name].id
  name                      = each.key
  rank                      = try(each.value.rule.rank, local.defaults.ise.policy.authorization_policies.rule.rank, null)
  default                   = try(each.value.rule.default, local.defaults.ise.policy.authorization_policies.rule.default, null)
  state                     = try(each.value.rule.state, local.defaults.ise.policy.authorization_policies.rule.state, null)
  profiles                  = try(each.value.profile, local.defaults.ise.policy.authorization_policies.profile, null)
  security_group            = try(each.value.security_group, local.defaults.ise.policy.authorization_policies.security_group, null)
  condition_type            = try(each.value.rule.condition.condition_type, local.defaults.ise.policy.authorization_policies.rule.condition.condition_type, null)
  condition_id              = contains(local.known_conditions, try(each.value.rule.condition.name, "")) ? ise_network_access_condition.network_access_condition[each.value.rule.condition.name].id : try(data.ise_network_access_condition.network_access_condition[each.value.rule.condition.name].id, null)
  condition_is_negate       = try(each.value.rule.condition.is_negate, local.defaults.ise.policy.authorization_policies.rule.condition.is_negate, null)
  condition_attribute_name  = try(each.value.rule.condition.attribute_name, local.defaults.ise.policy.authorization_policies.rule.condition.attribute_name, null)
  condition_attribute_value = try(each.value.rule.condition.attribute_value, local.defaults.ise.policy.authorization_policies.rule.condition.attribute_value, null)
  condition_dictionary_name = try(each.value.rule.condition.dictionary_name, local.defaults.ise.policy.authorization_policies.rule.condition.dictionary_name, null)
  condition_operator        = try(each.value.rule.condition.operator, local.defaults.ise.policy.authorization_policies.rule.condition.operator, null)

  children = try([for i in each.value.rule.condition.children : {
    attribute_name   = try(i.attribute_name, null)
    attribute_value  = try(i.attribute_value, null)
    condition_type   = try(i.condition_type, null)
    dictionary_name  = try(i.dictionary_name, null)
    dictionary_value = try(i.dictionary_value, null)
    is_negate        = try(i.is_negate, null)
    operator         = try(i.operator, null)
    id               = contains(local.known_conditions, try(i.name, "")) ? ise_network_access_condition.network_access_condition[i.name].id : try(data.ise_network_access_condition.network_access_condition[i.name].id, null)
    children = try([for j in i.children : {
      attribute_name   = try(j.attribute_name, null)
      attribute_value  = try(j.attribute_value, null)
      condition_type   = try(j.condition_type, null)
      dictionary_name  = try(j.dictionary_name, null)
      dictionary_value = try(j.dictionary_value, null)
      is_negate        = try(j.is_negate, null)
      operator         = try(j.operator, null)
      id               = contains(local.known_conditions, try(j.name, "")) ? ise_network_access_condition.network_access_condition[j.name].id : try(data.ise_network_access_condition.network_access_condition[j.name].id, null)
    }], null)
  }], null)

  depends_on = [ise_authorization_profile.authorization_profile, ise_trustsec_security_group.trustsec_security_group, ise_endpoint_identity_group.endpoint_identity_group, ise_user_identity_group.user_identity_group]
}
