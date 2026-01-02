provider "azurerm" {
  features {}
  subscription_id = "8815992d-6d35-46b1-bd5d-71421ea52e14"
}

provider "azapi" {}

provider "databricks" {
  azure_workspace_resource_id = module.databricks.workspace_id
}
