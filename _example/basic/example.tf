provider "azurerm" {
  features {}
}

##-----------------------------------------------------------------------------
## DNS zone module call
## Below module will deploy public dns in azure.
##-----------------------------------------------------------------------------
module "dns_zone" {
  source                       = "../.."
  name                         = "app"
  environment                  = "test"
  resource_group_name          = "test-rg"
  dns_zone_names               = "example.com"
  private_registration_enabled = false
  private_dns                  = false
  private_dns_zone_name        = ""
  virtual_network_id           = "/subscriptions/---------------------------"
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
