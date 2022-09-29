# Create resource group
resource "azurerm_resource_group" "infrarg" {
  name     = var.deploy_location
  location = var.rg_name

  tags = var.default_tags
}

# Create NSG
resource "azurerm_network_security_group" "infransg" {
  name                = var.network_security_group
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name

  tags = var.default_tags
}

# Create vNet and Subnets
resource "azurerm_virtual_network" "infravnet" {
  name                = var.virtual_network.name_vnet
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name
  address_space       = [var.virtual_network.address_space]

  subnet {
    name           = var.virtual_network.name_subnet1
    address_prefix = [var.virtual_network.address_prefix1]
    security_group = azurerm_network_security_group.infransg.id
  }

  subnet {
    name           = var.virtual_network.name_subnet2
    address_prefix = [var.virtual_network.address_prefix2]
    security_group = azurerm_network_security_group.infransg.id
  }

  tags = var.default_tags
}