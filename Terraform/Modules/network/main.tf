# terraform {
#   required_providers {
#     azapi = {
#       source  = "azure/azapi"
#       version = ">= 2.0.0"
#     }
#   }
# }

# provider "azapi" {}


data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.databricks_rg_name
}

data "azurerm_subnet" "storage_subnet" {
  name                 = var.storage_subnet        # exact existing subnet name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}


data "azurerm_subnet" "public" {
  name                 = var.public_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
}

resource "azapi_update_resource" "public_delegation" {
  type        = "Microsoft.Network/virtualNetworks/subnets@2023-05-01"
  resource_id = data.azurerm_subnet.public.id

  body = {
    properties = {
      delegations = [{
        name = "databricks-public-delegation"
        properties = {
          serviceName = "Microsoft.Databricks/workspaces"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
            "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
          ]
        }
      }]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = data.azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

data "azurerm_subnet" "private" {
  name                 = var.private_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
}

resource "azapi_update_resource" "private_delegation" {
  type        = "Microsoft.Network/virtualNetworks/subnets@2023-05-01"
  resource_id = data.azurerm_subnet.private.id

  body = {
    properties = {
      delegations = [{
        name = "databricks-private-delegation"
        properties = {
          serviceName = "Microsoft.Databricks/workspaces"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
            "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
          ]
        }
      }]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = data.azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}