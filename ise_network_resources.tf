locals {
  network_device_groups = [for group in try(local.ise.network_resources.network_device_groups, []) : {
    key         = "${try(join("/", group.path), "")}/${group.name}"
    order       = length(try(group.path, []))
    name        = format("%s#%s", join("#", try(group.path[0], "") == "All Device Types" ? concat(["Device Type"], try(group.path, [])) : (try(group.path[0], "") == "All Locations" ? concat(["Location"], try(group.path, [])) : concat([try(group.path[0], group.name)], try(group.path, [])))), group.name)
    description = try(group.description, local.defaults.ise.network_resources.network_device_groups.description, null)
    root_group  = try(group.path[0], "") == "All Device Types" ? "Device Type" : (try(group.path[0], "") == "All Locations" ? "Location" : try(group.path[0], group.name))
  }]
}

resource "ise_network_device_group" "network_device_group_0" {
  for_each = { for group in local.network_device_groups : group.key => group if var.manage_network_resources && group.order == 0 }

  name        = each.value.name
  description = each.value.description
  root_group  = each.value.root_group
}

resource "ise_network_device_group" "network_device_group_1" {
  for_each = { for group in local.network_device_groups : group.key => group if var.manage_network_resources && group.order == 1 }

  name        = each.value.name
  description = each.value.description
  root_group  = each.value.root_group

  depends_on = [ise_network_device_group.network_device_group_0]
}

resource "ise_network_device_group" "network_device_group_2" {
  for_each = { for group in local.network_device_groups : group.key => group if var.manage_network_resources && group.order == 2 }

  name        = each.value.name
  description = each.value.description
  root_group  = each.value.root_group

  depends_on = [ise_network_device_group.network_device_group_1]
}

resource "ise_network_device_group" "network_device_group_3" {
  for_each = { for group in local.network_device_groups : group.key => group if var.manage_network_resources && group.order == 3 }

  name        = each.value.name
  description = each.value.description
  root_group  = each.value.root_group

  depends_on = [ise_network_device_group.network_device_group_2]
}

resource "ise_network_device_group" "network_device_group_4" {
  for_each = { for group in local.network_device_groups : group.key => group if var.manage_network_resources && group.order == 4 }

  name        = each.value.name
  description = each.value.description
  root_group  = each.value.root_group

  depends_on = [ise_network_device_group.network_device_group_3]
}

resource "ise_network_device_group" "network_device_group_5" {
  for_each = { for group in local.network_device_groups : group.key => group if var.manage_network_resources && group.order == 5 }

  name        = each.value.name
  description = each.value.description
  root_group  = each.value.root_group

  depends_on = [ise_network_device_group.network_device_group_4]
}

# Workaround for ISE API issue where creating/deleting a network device immediately after creating/deleting a network device group fails
resource "time_sleep" "network_device_group_wait" {
  create_duration  = "5s"
  destroy_duration = "5s"

  depends_on = [ise_network_device_group.network_device_group_5]
}

resource "ise_network_device" "network_device" {
  for_each = { for nd in try(local.ise.network_resources.network_devices, []) : nd.name => nd if var.manage_network_resources }

  name                                          = each.value.name
  description                                   = try(each.value.description, local.defaults.ise.network_resources.network_devices.description, null)
  authentication_enable_key_wrap                = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.enable_key_wrap, local.defaults.ise.network_resources.network_devices.radius.enable_key_wrap, null) : null
  authentication_encryption_key                 = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.encryption_key, local.defaults.ise.network_resources.network_devices.radius.encryption_key, null) : null
  authentication_encryption_key_format          = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.encryption_key_format, local.defaults.ise.network_resources.network_devices.radius.encryption_key_format, null) : null
  authentication_message_authenticator_code_key = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.message_authenticator_code_key, local.defaults.ise.network_resources.network_devices.radius.message_authenticator_code_key, null) : null
  authentication_network_protocol               = try(each.value.authentication_network_protocol, local.defaults.ise.network_resources.network_devices.authentication_network_protocol, null)
  authentication_radius_shared_secret           = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null)
  authentication_enable_multi_secret            = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.second_shared_secret, local.defaults.ise.network_resources.network_devices.radius.second_shared_secret, null) != null : null
  authentication_second_radius_shared_secret    = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.second_shared_secret, local.defaults.ise.network_resources.network_devices.radius.second_shared_secret, null) : null
  authentication_dtls_required                  = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.dtls_required, local.defaults.ise.network_resources.network_devices.radius.dtls_required, null) : null
  coa_port                                      = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.coa_port, local.defaults.ise.network_resources.network_devices.radius.coa_port, null) : null
  dtls_dns_name                                 = try(each.value.radius.shared_secret, local.defaults.ise.network_resources.network_devices.radius.shared_secret, null) != null ? try(each.value.radius.dtls_dns_name, local.defaults.ise.network_resources.network_devices.radius.dtls_dns_name, null) : null
  ips = try([for i in each.value.ips : {
    ipaddress         = try(i.ip, local.defaults.ise.network_resources.network_devices.ips.ip, null)
    ipaddress_exclude = try(i.ip_exclude, local.defaults.ise.network_resources.network_devices.ips.ip_exclude, null)
    mask              = try(i.mask, local.defaults.ise.network_resources.network_devices.ips.mask, null)
  }], null)
  model_name = try(each.value.model_name, local.defaults.ise.network_resources.network_devices.model_name, null)
  network_device_groups = try(each.value.network_device_groups, null) == null ? null : [
    for group in try(each.value.network_device_groups, []) : split("/", group)[0] == "All Device Types" ? format("Device Type#%s", join("#", split("/", group))) : (split("/", group)[0] == "All Locations" ? format("Location#%s", join("#", split("/", group))) : (split("/", group)[0] == "Is IPSEC Device" ? format("IPSEC#%s", join("#", split("/", group))) : format("%s#%s", split("/", group)[0], join("#", split("/", group)))))
  ]
  software_version                                            = try(each.value.software_version, local.defaults.ise.network_resources.network_devices.software_version, null)
  profile_name                                                = try(each.value.profile_name, local.defaults.ise.network_resources.network_devices.profile_name, null)
  snmp_link_trap_query                                        = try(each.value.snmp.ro_community, local.defaults.ise.network_resources.network_devices.snmp.ro_community, null) != null ? try(each.value.snmp.link_trap_query, local.defaults.ise.network_resources.network_devices.snmp.link_trap_query, null) : null
  snmp_mac_trap_query                                         = try(each.value.snmp.ro_community, local.defaults.ise.network_resources.network_devices.snmp.ro_community, null) != null ? try(each.value.snmp.mac_trap_query, local.defaults.ise.network_resources.network_devices.snmp.mac_trap_query, null) : null
  snmp_originating_policy_service_node                        = try(each.value.snmp.ro_community, local.defaults.ise.network_resources.network_devices.snmp.ro_community, null) != null ? try(each.value.snmp.originating_policy_services_node, local.defaults.ise.network_resources.network_devices.snmp.originating_policy_services_node, null) : null
  snmp_polling_interval                                       = try(each.value.snmp.ro_community, local.defaults.ise.network_resources.network_devices.snmp.ro_community, null) != null ? try(each.value.snmp.polling_interval, local.defaults.ise.network_resources.network_devices.snmp.polling_interval, null) : null
  snmp_ro_community                                           = try(each.value.snmp.ro_community, local.defaults.ise.network_resources.network_devices.snmp.ro_community, null)
  snmp_version                                                = try(each.value.snmp.ro_community, local.defaults.ise.network_resources.network_devices.snmp.ro_community, null) != null ? try(each.value.snmp.version, local.defaults.ise.network_resources.network_devices.snmp.version, null) : null
  tacacs_connect_mode_options                                 = try(each.value.tacacs.shared_secret, local.defaults.ise.network_resources.network_devices.tacacs.shared_secret, null) != null ? try(each.value.tacacs.connect_mode_options, local.defaults.ise.network_resources.network_devices.tacacs.connect_mode_options, null) : null
  tacacs_shared_secret                                        = try(each.value.tacacs.shared_secret, local.defaults.ise.network_resources.network_devices.tacacs.shared_secret, null)
  trustsec_coa_source_host                                    = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.coa_source_host, local.defaults.ise.network_resources.network_devices.trust_sec.coa_source_host, null) : null
  trustsec_device_id                                          = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null)
  trustsec_device_password                                    = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.device_password, local.defaults.ise.network_resources.network_devices.trust_sec.device_password, null) : null
  trustsec_rest_api_username                                  = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.rest_api_username, local.defaults.ise.network_resources.network_devices.trust_sec.rest_api_username, null) : null
  trustsec_rest_api_password                                  = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.rest_api_password, local.defaults.ise.network_resources.network_devices.trust_sec.rest_api_password, null) : null
  trustsec_enable_mode_password                               = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.enable_mode_password, local.defaults.ise.network_resources.network_devices.trust_sec.enable_mode_password, null) : null
  trustsec_exec_mode_password                                 = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.exec_mode_password, local.defaults.ise.network_resources.network_devices.trust_sec.exec_mode_password, null) : null
  trustsec_exec_mode_username                                 = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.exec_mode_username, local.defaults.ise.network_resources.network_devices.trust_sec.exec_mode_username, null) : null
  trustsec_include_when_deploying_sgt_updates                 = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.include_when_deploying_sgt_updates, local.defaults.ise.network_resources.network_devices.trust_sec.include_when_deploying_sgt_updates, null) : null
  trustsec_download_enviroment_data_every_x_seconds           = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.download_enviroment_data_every_x_seconds, local.defaults.ise.network_resources.network_devices.trust_sec.download_enviroment_data_every_x_seconds, null) : null
  trustsec_download_peer_authorization_policy_every_x_seconds = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.download_peer_authorization_policy_every_x_seconds, local.defaults.ise.network_resources.network_devices.trust_sec.download_peer_authorization_policy_every_x_seconds, null) : null
  trustsec_download_sgacl_lists_every_x_seconds               = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.download_sgacl_lists_every_x_seconds, local.defaults.ise.network_resources.network_devices.trust_sec.download_sgacl_lists_every_x_seconds, null) : null
  trustsec_other_sga_devices_to_trust_this_device             = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.other_sga_devices_to_trust_this_device, local.defaults.ise.network_resources.network_devices.trust_sec.other_sga_devices_to_trust_this_device, null) : null
  trustsec_re_authentication_every_x_seconds                  = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.re_authentication_every_x_seconds, local.defaults.ise.network_resources.network_devices.trust_sec.re_authentication_every_x_seconds, null) : null
  trustsec_send_configuration_to_device                       = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.send_configuration_to_device, local.defaults.ise.network_resources.network_devices.trust_sec.send_configuration_to_device, null) : null
  trustsec_send_configuration_to_device_using                 = try(each.value.trust_sec.device_id, local.defaults.ise.network_resources.network_devices.trust_sec.device_id, null) != null ? try(each.value.trust_sec.send_configuration_to_device_using, local.defaults.ise.network_resources.network_devices.trust_sec.send_configuration_to_device_using, null) : null

  depends_on = [ise_network_device_group.network_device_group_5, time_sleep.network_device_group_wait]
}
