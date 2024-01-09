output "dns_zone_id" {
  value       = module.dns_zone.dns_zone_id
  description = "The DNS Zone ID."
}

output "dns_zone_number_of_record_sets" {
  value       = module.dns_zone.dns_zone_number_of_record_sets
  description = "The number of records already in the zone."
}

output "dns_zone_name_servers" {
  value       = module.dns_zone.dns_zone_name_servers
  description = " A list of values that make up the NS record for the zone."
}

output "dns_zone_max_number_of_record_sets" {
  value       = module.dns_zone.dns_zone_max_number_of_record_sets
  description = " Maximum number of Records in the zone. Defaults to 1000."
}

output "private_dns_zone_id" {
  value       = module.dns_zone.private_dns_zone_id
  description = "The Private DNS Zone ID."
}

output "private_dns_zone_number_of_record_sets" {
  value       = module.dns_zone.private_dns_zone_number_of_record_sets
  description = "The current number of record sets in this Private DNS zone."
}

output "private_dns_zone_max_number_of_record_sets" {
  value       = module.dns_zone.private_dns_zone_max_number_of_record_sets
  description = "The maximum number of record sets that can be created in this Private DNS zone."
}

output "private_dns_zone_max_number_of_virtual_network_links" {
  value       = module.dns_zone.private_dns_zone_max_number_of_virtual_network_links
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone."
}

output "private_dns_zone_max_number_of_virtual_network_links_with_registration" {
  value       = module.dns_zone.private_dns_zone_max_number_of_virtual_network_links_with_registration
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled."
}

output "private_dns_zone_virtual_network_link_id" {
  value       = module.dns_zone.private_dns_zone_virtual_network_link_id
  description = "The ID of the Private DNS Zone Virtual Network Link."
}

output "dns_a_record_id" {
  value       = module.dns_zone.dns_a_record_id
  description = " The DNS A Record ID."
}

output "dns_a_record_fqdn" {
  value       = module.dns_zone.dns_a_record_fqdn
  description = "The FQDN of the DNS A Record."
}

output "dns_cname_record_id" {
  value       = module.dns_zone.dns_cname_record_id
  description = " The DNS CNAME Record ID."
}

output "dns_cname_record_fqdn" {
  value       = module.dns_zone.dns_cname_record_fqdn
  description = "The FQDN of the DNS CNAME Record."
}

output "dns_ns_record_id" {
  value       = module.dns_zone.dns_ns_record_id
  description = " The DNS NS Record ID."
}

output "dns_ns_record_fqdn" {
  value       = module.dns_zone.dns_ns_record_fqdn
  description = "The FQDN of the DNS NS Record."
}
