# Create resource group
resource "azurerm_resource_group" "infra" {
  name     = var.deploy_location
  location = var.rg_name

  tags = var.default_tags
}

# Create NSG
resource "azurerm_network_security_group" "infra" {
  name                = var.network_security_group
  location            = azurerm_resource_group.infra.location
  resource_group_name = azurerm_resource_group.infra.name

  tags = var.default_tags
}

# Create vNet and Subnets
resource "azurerm_virtual_network" "infra" {
  name                = var.name_vnet
  location            = azurerm_resource_group.infra.location
  resource_group_name = azurerm_resource_group.infra.name
  address_space       = var.address_space

  subnet {
    name           = var.name_subnet1
    address_prefix = var.address_prefix1
    security_group = azurerm_network_security_group.infra.id
  }

  subnet {
    name           = var.name_subnet2
    address_prefix = var.address_prefix2
    security_group = azurerm_network_security_group.infra.id
  }

  tags = var.default_tags
}