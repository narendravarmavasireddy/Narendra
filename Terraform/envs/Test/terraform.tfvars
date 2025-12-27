location            = "eastus"
rg_name             = "Terraform-automation"
databricks_rg_name  = "rg-datalake-databricks-int-test"
databricks_name     = "fmc-demo-workspace-test"

vnet_name           = "Terraform-vnet"
NSG                 = "DataBricksNSG"

public_subnet_name  = "public_subnet"
private_subnet_name = "private_subnet"
storage_subnet = "storage_subnet"

storage_account_name = "datalakeadlsdemotest"
key_vault_name       = "kv-test-demoexam"

private_dns_zones = {
  blob = "privatelink.blob.core.windows.net"
  kv   = "privatelink.vaultcore.azure.net"
  # dfs = "privatelink.dfs.core.windows.net"
}
