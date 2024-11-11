output "private_dns_zone_id" {
  value       = module.private_dns_zone.private_dns_zone_id
  description = "The DNS Zone ID."
}


output "private_dns_zone_number_of_record_sets" {
  value       = module.private_dns_zone.private_dns_zone_number_of_record_sets
  description = "The number of records already in the zone."
}
