terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0"
    }
  }
}

variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "storage_account_name" {
    type = string
}
