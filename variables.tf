variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources will be created"
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group"
}

variable "bastion_rg_name" {
  type        = string
  description = "Name of the Bastion Resource group"
}

variable "network_security_group" {
  type        = string
  description = "Name of the NSG"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to add to deployed resources"
}

variable "virtual_network" {
  type        = map(string)
  description = "Name of vNet/Subnet resources"
}

variable "subnets" {
  type        = map(any)
  description = "List of subnets"
  default = {
    subnet_1 = {
      name             = "infra-lab-front"
      address_prefixes = ["192.168.0.0/24"]
    },
    subnet_2 = {
      name             = "infra-lab-back"
      address_prefixes = ["192.168.1.0/24"]
    },
    subnet_3 = {
      name             = "infra-lab-k8s"
      address_prefixes = ["192.168.2.0/24"]
    },
    # Gateway Subnet for S2S VPN
    subnet_4 = {
      name             = "GatewaySubnet"
      address_prefixes = ["192.168.255.192/27"]
    },
    # The name must be AzureBastionSubnet
    bastion_subnet = {
      name             = "AzureBastionSubnet"
      address_prefixes = ["192.168.255.224/27"]
    }
  }
}

variable "bastion_host_name" {
  type        = string
  description = "Azure Bastion Host name"
}

variable "ip_configuration_name" {
  type        = string
  description = "Azure Bastion IP configuration name"
}