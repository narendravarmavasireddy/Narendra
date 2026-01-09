data "azurerm_user_assigned_identity" "databricks_mrg_identity" {
  name                = "dbmanagedidentity"
  resource_group_name = module.databricks.managed_resource_group_name
}
