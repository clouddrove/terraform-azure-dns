# Terraform version
terraform {
  required_version = ">= 1.6.6"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.86.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0" # Your version constraint here
    }
  }
}
