provider "azurerm" {
  features {}
}


module "resource_group" {
  source      = "clouddrove/resource-group/azure"
  version     = "1.0.0"
  name        = "app"
  environment = "test"
  label_order = ["environment", "name", ]
  location    = "East US"
}

module "vnet" {
  depends_on          = [module.resource_group]
  source              = "clouddrove/vnet/azure"
  version             = "1.0.1"
  name                = "app"
  environment         = "test"
  label_order         = ["name", "environment"]
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
  enable_ddos_pp      = false
}

module "dns_zone" {
  depends_on                   = [module.resource_group, module.vnet]
  source                       = "../"
  label_order                  = ["name", "environment"]
  name                         = "app"
  environment                  = "test"
  resource_group_name          = module.resource_group.resource_group_name
  enabled_dns                  = true
  dns_zone_names               = "example.com"
  private_registration_enabled = false
  private_dns                  = false
  private_dns_zone_name        = ""
  virtual_network_id           = module.vnet.vnet_id
  a_record_name                = ["test1", "test2"]
  a_records                    = ["10.10.0.0"]
  a_record_ttl                 = 3600

  cname_records = [{
    name               = "test1"
    ttl                = 3600
    record             = "example.com"
    target_resource_id = null
    },
  ]

  ns_records = [{
    name    = "test2"
    ttl     = 3600
    records = ["ns1.example.com.", "ns2.example.com."]
  }]

}
