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

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
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

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "A container that holds related resources for an Azure solution"
}

## dns_zone
variable "domain_name" {
  type        = string
  default     = ""
  description = "Name of Domain"
}

variable "a_records" {
  type        = list(any)
  default     = []
  description = "(Optional) Specifies a list of A records to create in the specified DNS zone."
}

variable "aaaa_records" {
  type        = list(any)
  default     = []
  description = "(Optional) Specifies a list of AAAA records to create in the specified DNS zone."
}

variable "mx_records" {
  type        = any
  default     = {}
  description = "(Optional) Specifies a map of MX records to create in the specified DNS zone."
}
