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
  storage = {
    subresource_names = ["blob"]
    dns_key           = "blob"
  }

  dfs = {
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
