# Create Network Infrastructure resource group
resource "azurerm_resource_group" "infrarg" {
  name     = var.rg_name
  location = var.deploy_location

  tags = var.default_tags
}

# Create Bastion resource group
resource "azurerm_resource_group" "bastionrg" {
  name     = var.bastion_rg_name
  location = var.deploy_location

  tags = var.default_tags
}

# Create NSG
resource "azurerm_network_security_group" "infransg" {
  name                = var.network_security_group
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name

  tags = var.default_tags
}

# Create vNet
resource "azurerm_virtual_network" "infravnet" {
  name                = var.virtual_network.name_vnet
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name
  address_space       = [var.virtual_network.address_space]
}

# Create Subnets
resource "azurerm_subnet" "infrasubnet" {
  for_each             = var.subnets
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.infravnet.name
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]
  service_endpoints    = ["Microsoft.AzureActiveDirectory", "Microsoft.ContainerRegistry", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]
}

# Create Public IP
resource "azurerm_public_ip" "infrabastionpip" {
  name                = "${var.bastion_host_name}PubIP"
  location            = azurerm_resource_group.bastionrg.location
  resource_group_name = azurerm_resource_group.bastionrg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.default_tags
}

# Create Bastion Host
resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.bastionrg.location
  resource_group_name = azurerm_resource_group.bastionrg.name
  tags                = var.default_tags

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = azurerm_subnet.infrasubnet["bastion_subnet"].id
    public_ip_address_id = azurerm_public_ip.infrabastionpip.id
  }

}