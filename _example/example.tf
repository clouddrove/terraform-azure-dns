provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.0"

  environment = "tested"
  label_order = ["name", "environment", ]

  name     = "example"
  location = "North Europe"
}

module "dns" {
  source      = "./../"
  name        = "dns"
  environment = "test"
  label_order = ["name", "environment", ]
  domain_name = "mytest.com"

  resource_group_name = module.resource_group.resource_group_name

  a_records = [
    {
      name    = "www"
      records = ["10.10.10.1"]
      ttl     = 3600
    },
    {
      name    = "myshop"
      records = ["10.10.10.2"]
      ttl     = 3600
    }
  ]

}
