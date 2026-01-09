location            = "eastus"
rg_name             = "Terraform-automation"
databricks_rg_name  = "rg-datalake-databricks-int-test"
databricks_name     = "fmc-demo-workspace-test"

vnet_name           = "Terraform-vnet"
NSG                 = "DataBricksNSG"

public_subnet_name  = "public_subnet"
private_subnet_name = "private_subnet"
storage_subnet = "storage_subnet"

storage_account_name = "datalakeadlszzzztest"
key_vault_name       = "kv-test-zzzexam"

prefix   = "test-data"

private_endpoints = {
  storage_blob = {
    subresource_names = ["blob"]
    dns_key           = "blob"
  }

  storage_dfs = {
    subresource_names = ["dfs"]
    dns_key           = "dfs"
  }

  databricks = {
    subresource_names = ["databricks_ui_api"]
    dns_key           = "uiapi"
  }

  keyvault = {
    subresource_names = ["vault"]
    dns_key           = "kv"
  }
}

private_dns_zones = {
  blob = "privatelink.blob.core.windows.net"
  kv   = "privatelink.vaultcore.azure.net"
  dfs = "privatelink.dfs.core.windows.net"
  uiapi = "privatelink.azuredatabricks.net"
}

metastore_name = "uc-metastore-test"

metastore_storage_root = "abfss://unitycatalog@sttestuc001.dfs.core.windows.net/"

metastore_owner = "uc-admins"

principal_id         = "f2306d81-6f2e-4e8a-b203-44cd77f8c32f"
