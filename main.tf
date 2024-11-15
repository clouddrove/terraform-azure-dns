##-----------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source      = "clouddrove/labels/azure"
  version     = "1.0.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

##-----------------------------------------------------------------------------
## Below resource will deploy public DNS zone in azure.
##-----------------------------------------------------------------------------
resource "azurerm_dns_zone" "dns_zone" {
  count               = var.enable && var.enable_public_dns ? 1 : 0
  name                = var.dns_zone_names
  resource_group_name = var.resource_group_name
  tags                = module.labels.tags
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
}

##-----------------------------------------------------------------------------
## Below resource will add a_record in DNS zone.
##-----------------------------------------------------------------------------
resource "azurerm_dns_a_record" "records_a" {
  for_each            = var.enable && var.enable_public_dns ? { for record in var.a_records : record.name => record } : {}
  name                = lookup(each.value, "name", null) # Required
  zone_name           = azurerm_dns_zone.dns_zone[0].name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(each.value, "ttl", null)                # Required
  records             = lookup(each.value, "records", null)            # Optional(Conflicts with target_resource_id) {Either records OR target_resource_id must be specified, but not both.}
  target_resource_id  = lookup(each.value, "target_resource_id", null) # Optional(Conflicts with records) {Either records OR target_resource_id must be specified, but not both.}
  tags                = module.labels.tags
}

##-----------------------------------------------------------------------------
## Below resource will add cname_record in DNS zone.
##-----------------------------------------------------------------------------
resource "azurerm_dns_cname_record" "records_cname" {
  for_each            = var.enable && var.enable_public_dns ? { for record in var.cname_records : record.name => record } : {}
  name                = lookup(each.value, "name", null) # Required
  zone_name           = azurerm_dns_zone.dns_zone[0].name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(each.value, "ttl", null)                # Required
  record              = lookup(each.value, "record", null)             # Optional(Conflicts with target_resource_id) {Either record OR target_resource_id must be specified, but not both.}
  target_resource_id  = lookup(each.value, "target_resource_id", null) # Optional(Conflicts with record) {Either records OR target_resource_id must be specified, but not both.}
  tags                = module.labels.tags
}

##-----------------------------------------------------------------------------
## Below resource will add ns_record in DNS zone.
##-----------------------------------------------------------------------------
resource "azurerm_dns_ns_record" "records_ns" {
  for_each            = var.enable && var.enable_public_dns ? { for record in var.ns_records : record.name => record } : {}
  name                = each.value.name
  zone_name           = azurerm_dns_zone.dns_zone[0].name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  tags                = module.labels.tags
}

##-----------------------------------------------------------------------------
## Below resource will deploy private DNS zone in azure.
##-----------------------------------------------------------------------------
resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = var.enable && var.enable_private_dns ? 1 : 0
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
  dynamic "soa_record" {
    for_each = var.soa_record_private_dns
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

##-----------------------------------------------------------------------------
## Below resource will deploy vnet link in private dns zone.
##-----------------------------------------------------------------------------
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_vnet_link" {
  count                 = var.enable && var.enable_private_dns ? 1 : 0
  name                  = format("%s-vnet-link", module.labels.id)
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone[0].name
  registration_enabled  = var.private_registration_enabled
  virtual_network_id    = var.virtual_network_id
  tags                  = module.labels.tags
}

##-----------------------------------------------------------------------------
## Below resource will deploy vnet link in private dns zone.
##-----------------------------------------------------------------------------
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_vnet_link_addon" {
  count                 = var.enable && var.enable_private_dns && var.addon_virtual_network_id != null ? 1 : 0
  name                  = format("%s-vnet-link-addon", module.labels.id)
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone[0].name
  registration_enabled  = var.private_registration_enabled
  virtual_network_id    = var.addon_virtual_network_id
  tags                  = module.labels.tags
}


resource "azurerm_private_dns_cname_record" "private_record_cname" {
  for_each            = var.enable && var.enable_private_dns ? { for record in var.private_cname_records : record.name => record } : {}
  name                = each.value.name
  zone_name           = azurerm_private_dns_zone.private_dns_zone[0].name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(each.value, "ttl", null)
  record              = lookup(each.value, "record", null)
}

resource "azurerm_private_dns_a_record" "private_record_a" {
  for_each            = var.enable && var.enable_private_dns ? { for record in var.private_a_records : record.name => record } : {}
  name                = "test"
  zone_name           = azurerm_private_dns_zone.private_dns_zone[0].name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(each.value, "ttl", null)
  records             = lookup(each.value, "records", null)
  tags                = module.labels.tags
}