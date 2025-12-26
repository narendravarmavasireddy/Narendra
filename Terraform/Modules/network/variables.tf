terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azapi = {
      source = "azure/azapi"
    }
  }
}



variable "rg_name" {}
variable "vnet_name" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "databricks_rg_name" {}
variable "location" {}
variable "nsg_name" {}
variable "storage_subnet" {
  
}
