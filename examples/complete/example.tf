provider "azurerm" {
  features {}
  subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
}

locals {
  name        = "app"
  environment = "test"
  label_order = ["name", "environment", ]
}

##-----------------------------------------------------------------------------
## Resource Group module call
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "clouddrove/resource-group/azure"
  version     = "1.0.2"
  name        = local.name
  environment = local.environment
  label_order = local.label_order
  location    = "East US"
}

##-----------------------------------------------------------------------------
## Vnet module call
##-----------------------------------------------------------------------------
module "vnet" {
  depends_on          = [module.resource_group]
  source              = "clouddrove/vnet/azure"
  version             = "1.0.4"
  name                = local.name
  environment         = local.environment
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

##-----------------------------------------------------------------------------
## DNS zone module call
## Below module will deploy public dns in azure.
##-----------------------------------------------------------------------------
module "dns_zone" {
  depends_on                   = [module.resource_group, module.vnet]
  source                       = "../.."
  name                         = local.name
  environment                  = local.environment
  resource_group_name          = module.resource_group.resource_group_name
  dns_zone_names               = "cdexample.com"
  private_registration_enabled = false
  virtual_network_id           = module.vnet.vnet_id
  a_records = [{
    name    = "test"
    ttl     = 3600
    records = ["10.0.180.17", "10.0.180.18"]
    },
    {
      name    = "test2"
      ttl     = 3600
      records = ["10.0.180.17", "10.0.180.18"]
  }]

  cname_records = [{
    name   = "test1"
    ttl    = 3600
    record = "example.com"
  }]

  ns_records = [{
    name    = "test2"
    ttl     = 3600
    records = ["ns1.example.com.", "ns2.example.com."]
  }]
}