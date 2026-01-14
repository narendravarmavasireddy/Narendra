resource "azurerm_storage_account" "datalake" {
  name                     = var.storage_account_name
  location                    = var.location
  resource_group_name         = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "GRS"
  is_hns_enabled           = true
  public_network_access_enabled = false

  tags = {
    environment = "Test"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "fmcdatalake"
  storage_account_id    = azurerm_storage_account.datalake.id
  container_access_type = "private"
}

output "storage_id" {
  value = azurerm_storage_account.datalake.id
}
