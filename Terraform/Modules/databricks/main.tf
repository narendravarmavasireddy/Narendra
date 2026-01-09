resource "azurerm_databricks_access_connector" "connector" {
  name                = "${var.databricks_name}-acc"
  location            = var.location
  resource_group_name = var.databricks_rg_name

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_databricks_workspace" "workspace" {
  name                        = var.databricks_name
  location                    = var.location
  resource_group_name         = var.databricks_rg_name
  sku                         = "premium"
  managed_resource_group_name = "${var.databricks_name}-mrg"
  public_network_access_enabled = false
  network_security_group_rules_required = "NoAzureDatabricksRules"

  identity {
    type = "SystemAssigned"
  }

  custom_parameters {
    no_public_ip = true
    virtual_network_id = var.vnet_id
    public_subnet_name  = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    public_subnet_network_security_group_association_id  = var.public_nsg_assoc_id
    private_subnet_network_security_group_association_id = var.private_nsg_assoc_id
  }

  depends_on = [azurerm_databricks_access_connector.connector]
}

