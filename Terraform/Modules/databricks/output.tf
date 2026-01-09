output "workspace_id" {
  value = azurerm_databricks_workspace.workspace.id
}
output "access_connector_principal_id" {
  value = azurerm_databricks_access_connector.connector.identity[0].principal_id
}
