output "dns_zone_id" {
  value       = azurerm_dns_zone.dns_zone[0].id
  description = "The DNS Zone ID."
}

output "dns_zone_number_of_record_sets" {
  value       = azurerm_dns_zone.dns_zone[0].number_of_record_sets
  description = "The number of records already in the zone."
}

output "dns_zone_name_servers" {
  value       = azurerm_dns_zone.dns_zone[0].name_servers
  description = " A list of values that make up the NS record for the zone."
}

output "dns_zone_max_number_of_record_sets" {
  value       = azurerm_dns_zone.dns_zone[0].max_number_of_record_sets
  description = " Maximum number of Records in the zone. Defaults to 1000."
}

output "private_dns_zone_id" {
  value       = var.enabled && var.private_dns ? azurerm_private_dns_zone.private_dns_zone[0].id : null
  description = "The Private DNS Zone ID."
}

output "private_dns_zone_number_of_record_sets" {
  value       = var.enabled && var.private_dns ? azurerm_private_dns_zone.private_dns_zone[0].number_of_record_sets : null
  description = "The current number of record sets in this Private DNS zone."
}

output "private_dns_zone_max_number_of_record_sets" {
  value       = var.enabled && var.private_dns ? azurerm_private_dns_zone.private_dns_zone[0].max_number_of_record_sets : null
  description = "The maximum number of record sets that can be created in this Private DNS zone."
}

output "private_dns_zone_max_number_of_virtual_network_links" {
  value       = var.enabled && var.private_dns ? azurerm_private_dns_zone.private_dns_zone[0].max_number_of_virtual_network_links : null
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone."
}

output "private_dns_zone_max_number_of_virtual_network_links_with_registration" {
  value       = var.enabled && var.private_dns ? azurerm_private_dns_zone.private_dns_zone[0].max_number_of_virtual_network_links_with_registration : null
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled."
}

output "private_dns_zone_virtual_network_link_id" {
  value       = var.enabled && var.private_dns ? azurerm_private_dns_zone_virtual_network_link.private_dns_vnet_link[0].id : null
  description = "The ID of the Private DNS Zone Virtual Network Link."
}

output "dns_a_record_id" {
  value       = values(azurerm_dns_a_record.records_a)[*].id
  description = " The DNS A Record ID."
}

output "dns_cname_record_id" {
  value       = values(azurerm_dns_cname_record.records_cname)[*].id
  description = " The DNS CNAME Record ID."
}

output "dns_ns_record_id" {
  value       = values(azurerm_dns_ns_record.records_ns)[*].id
  description = " The DNS NS Record ID."
}

output "dns_a_record_fqdn" {
  value       = values(azurerm_dns_a_record.records_a)[*].fqdn
  description = "The FQDN of the DNS A Record."
}

output "dns_cname_record_fqdn" {
  value       = values(azurerm_dns_cname_record.records_cname)[*].fqdn
  description = "The FQDN of the DNS CNAME Record."
}

output "dns_ns_record_fqdn" {
  value       = values(azurerm_dns_ns_record.records_ns)[*].fqdn
  description = "The FQDN of the DNS NS Record."
}
