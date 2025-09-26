provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG" {
  name = "Terraform-automation"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name = "Terraform-vnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "subnet" {
  name = "Terraform-subnet"
  resource_group_name = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "network" {
  name = "Terraform-nic"
  location = azurerm_resource_group.RG.location
  resource_group_name = azurerm_reosurce_group.RG.name
  ip_configuration {
    name = "Terraform"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_allocation = "Dynamic"
  }
}
