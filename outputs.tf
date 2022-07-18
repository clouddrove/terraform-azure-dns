output "zone_name" {
  value       = join("", azurerm_dns_zone.main.*.name)
  description = "Name of dns zone"
}

output "zone_id" {
  value       = join("", azurerm_dns_zone.main.*.id)
  description = "ID of dns zone"
}

output "a_record_id" {
  value       = join("", azurerm_dns_a_record.a_record_public_with_zone.*.id)
  description = "A list of DNS A Record ID."
}

output "a_record_name" {
  value       = join("", azurerm_dns_a_record.a_record_public_with_zone.*.name)
  description = "A list of DNS A Record Name."
}

output "aaaa_record_id" {
  value       = join("", azurerm_dns_aaaa_record.aaaa_record_public_with_zone.*.id)
  description = "A list of DNS AAAA Record ID."
}
