#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(string)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy, eg ''."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "dns_zone_names" {
  type        = string
  default     = null
  description = "The public dns zone to be created for internal vnet resolution"

}

variable "private_dns_zone_name" {
  type        = string
  default     = null
  description = "The private dns zone to be created for internal vnet resolution"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group where the Azure DNS resides"
}

variable "private_registration_enabled" {
  type        = bool
  default     = false
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? Default to false"
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control complete module creation."
}

variable "enable_public_dns" {
  type        = bool
  default     = true
  description = "Flag to control creation of public dns"
}

variable "enable_private_dns" {
  type        = bool
  default     = false
  description = "Flag to control creation of private dns"
}
variable "virtual_network_id" {
  type        = string
  default     = ""
  description = "The name of the virtual network"
}

variable "addon_virtual_network_id" {
  type        = string
  default     = null
  description = "The name of the virtual network"
}

variable "soa_record_private_dns" {
  type        = list(object({}))
  default     = []
  description = "Customize details about the root block device of the instance. See Block Devices below for details."
}

variable "a_records" {
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default     = []
  description = "List of a records to be added in azure dns zone."
}

variable "private_a_records" {
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default     = []
  description = "List of cname records"
}

variable "cname_records" {
  type = list(object({
    name   = string
    ttl    = number
    record = string
  }))
  default     = []
  description = "List of cname records"
}

variable "private_cname_records" {
  type = list(object({
    name   = string
    ttl    = number
    record = string
  }))
  default     = []
  description = "List of cname records"
}

variable "ns_records" {
  type = list(object({
    name    = string,      #(Required) The name of the DNS NS Record. Changing this forces a new resource to be created.
    ttl     = number,      # (Required) The Time To Live (TTL) of the DNS record in seconds.
    records = list(string) #(Required) A list of values that make up the NS record.
  }))
  default     = []
  description = "List of ns records"
}

variable "soa_record" {
  type        = list(object({}))
  default     = []
  description = "Customize details about the root block device of the instance. See Block Devices below for details."
}
