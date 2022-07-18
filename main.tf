## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.


module "labels" {
  source  = "clouddrove/labels/azure"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

resource "azurerm_dns_zone" "main" {
  count               = var.enabled ? 1 : 0
  name                = var.domain_name
  resource_group_name = var.resource_group_name

  tags = module.labels.tags
}

resource "azurerm_dns_a_record" "a_record_public_with_zone" {
  count = var.enabled ? length(var.a_records) : 0

  zone_name           = join("", azurerm_dns_zone.main.*.name)
  resource_group_name = var.resource_group_name

  name    = var.a_records[count.index].name
  records = var.a_records[count.index].records
  ttl     = var.a_records[count.index].ttl

}

resource "azurerm_dns_aaaa_record" "aaaa_record_public_with_zone" {
  count = var.enabled ? length(var.aaaa_records) : 0

  zone_name           = join("", azurerm_dns_zone.main.*.name)
  resource_group_name = var.resource_group_name

  name    = var.aaaa_records[count.index].name
  records = var.aaaa_records[count.index].records
  ttl     = var.aaaa_records[count.index].ttl
}

resource "azurerm_dns_mx_record" "mx_record_public_with_zone" {
  count = var.mx_records == {} ? 0 : (var.enabled ? (var.enabled ? 1 : 0) : 0)

  zone_name           = join("", azurerm_dns_zone.main.*.name)
  resource_group_name = var.resource_group_name

  name = var.mx_records.name
  ttl  = lookup(var.mx_records, "ttl", 3600)

  dynamic "record" {
    for_each = lookup(var.mx_records, "records", {})

    content {
      preference = record.value.preference
      exchange   = record.value.exchange
    }
  }
}
