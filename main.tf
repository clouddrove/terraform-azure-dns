module "labels" {
  source      = "clouddrove/labels/azure"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}


resource "random_id" "this" {
  byte_length = "8"
}

resource "azurerm_dns_zone" "dns_zone" {
  count               = var.enabled && var.enabled_dns ? 1 : 0
  name                = var.dns_zone_names
  resource_group_name = var.resource_group_name
  tags                = module.labels.tags

}

resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = var.enabled && var.private_dns ? 1 : 0
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
  dynamic "soa_record" {
    for_each = var.soa_record
    content {
      email        = lookup(soa_record.value, "email", null)
      expire_time  = lookup(soa_record.value, "expire_time", null)
      minimum_ttl  = lookup(soa_record.value, "minimum_ttl", null)
      refresh_time = lookup(soa_record.value, "refresh_time", null)
      retry_time   = lookup(soa_record.value, "retry_time", null)
      ttl          = lookup(soa_record.value, "ttl", null)
    }
  }
  tags = module.labels.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_vnet_link" {
  count                 = var.enabled && var.private_dns ? 1 : 0
  name                  = "vnet-link-${random_id.this.hex}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = join("", azurerm_private_dns_zone.private_dns_zone.*.name)
  registration_enabled  = var.private_registration_enabled
  virtual_network_id    = var.virtual_network_id
  tags                  = module.labels.tags
}


resource "azurerm_dns_a_record" "example" {
  count               = var.enabled && var.enabled_dns ? length(var.a_record_name) : 0
  name                = element(var.a_record_name, count.index)
  zone_name           = join("", azurerm_dns_zone.dns_zone.*.name)
  resource_group_name = var.resource_group_name
  ttl                 = var.a_record_ttl
  records             = var.a_records
  tags                = module.labels.tags
}

resource "azurerm_dns_cname_record" "records_cname" {
  for_each = { for record in var.cname_records : record.name => record } #toset(var.cname_records)

  name                = each.value.name
  zone_name           = join("", azurerm_dns_zone.dns_zone.*.name)
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
  target_resource_id  = each.value.target_resource_id

}

resource "azurerm_dns_ns_record" "records_ns" {
  for_each = { for record in var.ns_records : record.name => record } #toset(var.ns_records)

  name                = each.value.name
  zone_name           = join("", azurerm_dns_zone.dns_zone.*.name)
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records

}