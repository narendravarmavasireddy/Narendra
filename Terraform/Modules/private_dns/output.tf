output "storage_dns_zone_id" {
  value = azurerm_private_dns_zone.storage.id
}

# output "dfs_dns_zone_id" {
#   value = azurerm_private_dns_zone.dfs.id
# }

output "keyvault_dns_zone_id" {
  value = azurerm_private_dns_zone.keyvault.id
}
