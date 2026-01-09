data "azurerm_resources" "databricks_mrg_identities" {
  resource_group_name = module.databricks.managed_resource_group_name
  type                = "Microsoft.ManagedIdentity/userAssignedIdentities"

  depends_on = [
    module.databricks
  ]
}

locals {
  databricks_mrg_identity = one([
    for r in data.azurerm_resources.databricks_mrg_identities.resources :
    r if r.name == "dbmanagedidentity"
  ])
}
