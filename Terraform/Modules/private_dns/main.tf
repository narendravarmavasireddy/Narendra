resource "azurerm_private_dns_zone" "this" {
  for_each = var.private_dns_zones

  name                = each.value
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.private_dns_zones

  name                  = "${each.key}-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.this[each.key].name
  virtual_network_id   = var.vnet_id
}


/*
resource "azurerm_private_dns_zone" "storage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.rg_name
}

# resource "azurerm_private_dns_zone" "dfs" {
#   name                = "privatelink.dfs.core.windows.net"
#   resource_group_name = var.rg_name
# }

resource "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "blob_link" {
  name                  = "blob-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.storage.name
  virtual_network_id   = var.vnet_id
}

# resource "azurerm_private_dns_zone_virtual_network_link" "dfs_link" {
#   name                  = "dfs-link"
#   resource_group_name   = var.rg_name
#   private_dns_zone_name = azurerm_private_dns_zone.dfs.name
#   virtual_network_id   = azurerm_virtual_network.vnet.id
# }

resource "azurerm_private_dns_zone_virtual_network_link" "kv_link" {
  name                  = "kv-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.keyvault.name
  virtual_network_id   = var.vnet_id
}
*/
