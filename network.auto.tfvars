deploy_location        = "canadacentral"
rg_name                = "infra-network-rg"
bastion_rg_name        = "infra-bastion-rg"
network_security_group = "infra-network-nsg"
ip_configuration_name  = "bastion_configuration"
bastion_pip_name       = "infra-bastion-pip1"
bastion_host_name      = "infra-bastion"

virtual_network = {
  name_vnet       = "infra-vnet-01"
  address_space   = "192.168.0.0/16"
  name_subnet1    = "infra-lab-front"
  address_prefix1 = "192.168.0.0/24"
  name_subnet2    = "infra-lab-back"
  address_prefix2 = "192.168.1.0/24"
  name_subnet3    = "infra-lab-k8s"
  address_prefix3 = "192.168.2.0/24"
}

default_tags = {
  environment = "Lab"
  designation = "Infrastructure"
  provisioner = "Terraform"
}

subnets = [

  {
    name             = "infra-lab-front"
    address_prefixes = ["192.168.0.0/24"]
  },

  {
    name             = "infra-lab-back"
    address_prefixes = ["192.168.1.0/24"]
  },

  {
    name             = "infra-lab-k8s"
    address_prefixes = ["192.168.2.0/24"]
  },

  # The name must be AzureBastionSubnet
  {
    name             = "AzureBastionSubnet"
    address_prefixes = ["192.168.255.224/27"]
  }
]