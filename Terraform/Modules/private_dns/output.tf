output "private_dns_zone_ids" {
  description = "Map of private DNS zone IDs keyed by zone name"
  value = {
    for k, v in azurerm_private_dns_zone.this :
    k => v.id
  }
}

/*
output "storage_dns_zone_id" {
  value = azurerm_private_dns_zone.storage.id
}

# output "dfs_dns_zone_id" {
#   value = azurerm_private_dns_zone.dfs.id
# }

output "keyvault_dns_zone_id" {
  value = azurerm_private_dns_zone.keyvault.id
}
*/
