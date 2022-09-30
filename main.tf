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

# Create vNet and Subnets
resource "azurerm_virtual_network" "infravnet" {
  name                = var.virtual_network.name_vnet
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name
  address_space       = [var.virtual_network.address_space]

  resource "azurerm_subnet" "infrasubnet" {
    for_each             = var.subnets
    resource_group_name  = var.rg_name
    virtual_network_name = azurerm_virtual_network.infravnet.name
    name                 = each.value["name"]
    address_prefixes     = each.value["address_prefixes"]
  }

  resource "azurerm_public_ip" "infrabastionpip" {
    name                = "${var.bastionhost_name}PubIP"
    location            = azurerm_resource_group.infravnet.location
    resource_group_name = azurerm_resource_group.bastionrg.name
    allocation_method   = "Static"
    sku                 = "Standard"
    tags                = var.default_tags
  }

  resource "azurerm_bastion_host" "bastion" {
    name                = var.bastionhost_name
    location            = azurerm_resource_group.infravnet.location
    resource_group_name = azurerm_resource_group.bastionrg.name
    tags                = var.default_tags

    ip_configuration {
      name                 = var.ip_configuration_name
      subnet_id            = azurerm_subnet.infrasubnet.id
      public_ip_address_id = azurerm_public_ip.infrabastionpip.id
    }
  }
  #   subnet {
  #     name           = var.virtual_network.name_subnet1
  #     address_prefix = var.virtual_network.address_prefix1
  #     security_group = azurerm_network_security_group.infransg.id
  #   }

  #   subnet {
  #     name           = var.virtual_network.name_subnet2
  #     address_prefix = var.virtual_network.address_prefix2
  #     security_group = azurerm_network_security_group.infransg.id
  #   }

  #   subnet {
  #     name           = var.virtual_network.name_subnet3
  #     address_prefix = var.virtual_network.address_prefix3
  #     security_group = azurerm_network_security_group.infransg.id
  #   }

  tags = var.default_tags

  #   lifecycle {
  #     # Set this to true to prevent any kind of deletion/state taint operation via Terraform.
  #     prevent_destroy = false
  #     # List of properties to be ignore by Terraform when it does a state refresh and plans changes to Azure
  #     ignore_changes = [
  #       subnet
  #     ]
  #   }
}