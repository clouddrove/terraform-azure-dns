output "zone_name" {
  value = module.dns.zone_name
  description = "Name of dns zone"
}

output "zone_id" {
  value = module.dns.zone_id
  description = "ID of dns zone"
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
  description = "The name of resource group."
}

output "resource_group_location" {
  value = module.resource_group.resource_group_location
  description = "The location of resource group."
}
