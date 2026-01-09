# --------------------------------------------------
# Storage Account RBAC
# --------------------------------------------------

resource "azurerm_role_assignment" "sp_storage_blob_contributor" {
  scope                = module.storage.storage_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.pipeline_sp_object_id
}

resource "azurerm_role_assignment" "databricks_mi_storage_blob_contributor" {
  scope                = module.storage.storage_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.databricks.managed_identity_principal_id
}

# --------------------------------------------------
# Databricks Workspace RBAC
# --------------------------------------------------

resource "azurerm_role_assignment" "sp_databricks_contributor" {
  scope                = module.databricks.workspace_id
  role_definition_name = "Contributor"
  principal_id         = var.pipeline_sp_object_id
}

# --------------------------------------------------
# Key Vault RBAC
# --------------------------------------------------

resource "azurerm_role_assignment" "sp_keyvault_admin" {
  scope                = module.keyvault.keyvault_id
  role_definition_name = "Key Vault Administrator"
  principal_id = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "databricks_mi_keyvault_secrets_user" {
  scope                = module.keyvault.keyvault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.pipeline_sp_object_id
}
