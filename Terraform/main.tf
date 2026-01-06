locals {
  pe_resource_ids = {
    storage_blob   = module.storage.storage_id
    storage_dfs       = module.storage.storage_id
    databricks = module.databricks.workspace_id
    keyvault   = module.keyvault.kv_id
  }
}

# 1. Resource Group for Databricks
module "resource_group" {
  source             = "./Modules/resource_group"
  databricks_rg_name = var.databricks_rg_name
  location           = var.location
}

# 2. Networking module (NSG, subnet delegation, associations)
module "network" {
  source               = "./Modules/network"
  rg_name              = var.rg_name
  databricks_rg_name   = module.resource_group.rg_name
  vnet_name            = var.vnet_name
  nsg_name             = var.NSG
  location             = var.location
  public_subnet_name   = var.public_subnet_name
  private_subnet_name  = var.private_subnet_name
  storage_subnet = var.storage_subnet
}

# 3. Storage (ADLS)
module "storage" {
  source                = "./Modules/storage"
  storage_account_name  = var.storage_account_name
  rg_name              = module.resource_group.rg_name
  location             = var.location
}

# 4. Key Vault
module "keyvault" {
  source           = "./Modules/keyvault"
  rg_name        = module.resource_group.rg_name
  location       = var.location
  key_vault_name   = var.key_vault_name
}

# 5. Databricks Workspace + Access Connector
module "databricks" {
  source                                = "./Modules/databricks"
  databricks_name                       = var.databricks_name
  databricks_rg_name                    = module.resource_group.rg_name
  location                              = var.location
  public_subnet_name                    = module.network.public_subnet_name
  private_subnet_name                   = module.network.private_subnet_name
  public_nsg_assoc_id                   = module.network.public_nsg_assoc_id
  private_nsg_assoc_id                  = module.network.private_nsg_assoc_id
  vnet_id                               = module.network.vnet_id
}

module "databricks_metastore" {
  source = "./Modules/databricks_metastore"

  metastore_name = var.metastore_name
  storage_root   = var.metastore_storage_root
  region         = var.region
  owner          = var.metastore_owner
  workspace_id   = module.databricks.workspace_id
}

module "private_dns" {
  source  = "./Modules/private_dns"
  rg_name = var.rg_name
  location = var.location
  private_dns_zones  = var.private_dns_zones
  vnet_id = module.network.vnet_id   # or data.azurerm_virtual_network.id
}

module "private_endpoints" {
  source   = "./Modules/private_endpoint"
  for_each = var.private_endpoints
  name      = "${var.prefix}-${each.key}-pe"
  rg_name   = var.rg_name
  location  = var.location
  subnet_id = module.network.storage_subnet_id
  resource_id        = local.pe_resource_ids[each.key]
  subresource_names  = each.value.subresource_names
  private_dns_zone_ids = [
    module.private_dns.private_dns_zone_ids[each.value.dns_key]
  ]
}


/*
module "storage_pe" {
  source                = "./Modules/private_endpoint"
  name                  = "storage-pe"
  rg_name               = var.rg_name
  location              = var.location
  subnet_id             = module.network.storage_subnet_id
  resource_id           = module.storage.storage_id
  subresource_names     = ["blob"]
#  private_dns_zone_ids  = [module.private_dns.storage_dns_zone_id]
  private_dns_zone_ids = [
    module.private_dns.private_dns_zone_ids["blob"]
  ]
}

module "dbfs_pe" {
  source                = "./Modules/private_endpoint"
  name                  = "dbfs-pe"
  rg_name               = var.rg_name
  location              = var.location
  subnet_id             = module.network.storage_subnet_id
  resource_id           = module.databricks.workspace_id
  subresource_names     = ["dfs"]
#  private_dns_zone_ids  = [module.private_dns.storage_dns_zone_id]
  private_dns_zone_ids = [
    module.private_dns.private_dns_zone_ids["dfs"]
  ]
}

module "databricks_pe" {
  source                = "./Modules/private_endpoint"
  name                  = "databricks-pe"
  rg_name               = var.rg_name
  location              = var.location
  subnet_id             = module.network.storage_subnet_id
  resource_id           = module.databricks.workspace_id
  subresource_names     = ["databricks_ui_api"]
#  private_dns_zone_ids  = [module.private_dns.storage_dns_zone_id]
  private_dns_zone_ids = [
    module.private_dns.private_dns_zone_ids["uiapi"]
  ]
}

module "kv_pe" {
  source                = "./Modules/private_endpoint"
  name                  = "kv-pe"
  rg_name               = var.rg_name
  location              = var.location
  subnet_id             = module.network.storage_subnet_id
  resource_id           = module.keyvault.kv_id
  subresource_names     = ["vault"]
#  private_dns_zone_ids  = [module.private_dns.keyvault_dns_zone_id]
  private_dns_zone_ids = [
    module.private_dns.private_dns_zone_ids["kv"]
  ]
}
*/

