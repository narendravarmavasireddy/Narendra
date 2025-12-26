resource "azurerm_resource_group" "dbrg" {
  name     = var.databricks_rg_name
  location = var.location
}

