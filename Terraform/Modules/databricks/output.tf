output "workspace_id" {
  value = azurerm_databricks_workspace.workspace.id
}
output "managed_identity_principal_id" {
  description = "Principal ID of Databricks system-assigned managed identity"
  value       = azurerm_databricks_workspace.workspace.identity[0].principal_id
}
