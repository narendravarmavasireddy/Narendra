output "databricks_workspace_id" {
  value = module.databricks.workspace_id
}
output "databricks_mrg_principal_id" {
  description = "Principal ID of Databricks managed identity in managed resource group"
  value       = local.databricks_mrg_principal_id
}
output "key_vault_uri" {
  value = module.keyvault.key_vault_uri
}

output "key_vault_id" {
  value = module.keyvault.kv_id
}
output "vnet_id" {
  value = module.network.vnet_id
}

output "public_subnet_name" {
  value = module.network.public_subnet_name
}

output "private_subnet_name" {
  value = module.network.private_subnet_name
}

output "storage_subnet_id" {
  value = module.network.storage_subnet_id
}
output "public_nsg_assoc_id" {
  value = module.network.public_nsg_assoc_id
}

output "private_nsg_assoc_id" {
  value = module.network.private_nsg_assoc_id
}
output "private_dns_zone_ids" {
  value = module.private_dns.private_dns_zone_ids
}
output "resource_group_name" {
  value = module.resource_group.rg_name
}

output "location" {
  value = module.resource_group.location
}
output "storage_account_id" {
  value = module.storage.storage_id
}

