data "azurerm_client_config" "current" {}

data "azapi_resource" "databricks_mrg_identity" {
  type      = "Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31"
  name      = "dbmanagedidentity"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${module.databricks.managed_resource_group_name}"

  depends_on = [
    module.databricks
  ]
}


locals {
  databricks_mrg_principal_id = data.azapi_resource.databricks_mrg_identity.output.properties.principalId
}

