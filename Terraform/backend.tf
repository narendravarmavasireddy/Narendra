terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-Automation"
    storage_account_name = "terraformdevtestsa" # Must be globally unique
    container_name       = "tfstate"
    key                  = "terraform.infra.tfstate"
  }
}
