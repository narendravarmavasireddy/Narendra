terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-Automation"
    storage_account_name = "terraformdevtestsa"
    container_name       = "tfstate"
    key                  = "terraform.infra.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.7.0" # OIDC support added in v3.7.0
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

