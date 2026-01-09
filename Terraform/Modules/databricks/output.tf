output "workspace_id" {
  value = azurerm_databricks_workspace.workspace.id
}
output "managed_resource_group_name" {
  description = "Databricks managed resource group name"
  value       = azurerm_databricks_workspace.workspace.managed_resource_group_name
}
