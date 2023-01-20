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
  type        = list(any)
  default     = []
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
  default     = null
  type        = string
  description = "The public dns zone to be created for internal vnet resolution"

}

variable "private_dns_zone_name" {
  default     = null
  type        = string
  description = "The private dns zone to be created for internal vnet resolution"
}

variable "private_dns_zone_vnet_links" {
  default     = []
  type        = list(string)
  description = "Virtual networks to create Private DNS virtual network links. This enables DNS resolution and registration using Azure Private DNS"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group where the Azure DNS resides"
}

variable "tags" {
  default     = null
  type        = map(string)
  description = "Tags to be passed to created instances"
}

variable "private_registration_enabled" {
  default     = true
  type        = bool
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
}
variable "enabled" {
  type    = bool
  default = true
}

variable "enabled_dns" {
  type    = bool
  default = false
}

variable "private_dns" {
  type    = bool
  default = false
}
variable "virtual_network_id" {
  default     = ""
  description = "The name of the virtual network"
}

variable "soa_record" {
  type        = list(any)
  default     = []
  description = "Customize details about the root block device of the instance. See Block Devices below for details."
}


variable "a_record_name" {
  type    = list(any)
  default = []
}

variable "a_records" {
  type    = list(string)
  default = []
}
variable "a_record_ttl" {
  type    = number
  default = null
}