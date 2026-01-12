output "databricks_workspace_id" {
  value = module.databricks.workspace_id
}
output "databricks_mrg_principal_id" {
  description = "Principal ID of Databricks managed identity in managed resource group"
  value       = local.databricks_mrg_principal_id
}

