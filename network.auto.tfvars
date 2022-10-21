deploy_location        = "canadacentral"
rg_name                = "infra-network-rg"
network_security_group = "infra-network-nsg"
bastion_rg_name        = "infra-bastion-rg"
ip_configuration_name  = "bastion-configuration"
bastion_pip_name       = "infra-bastion-pip1"
bastion_host_name      = "infra-bastion"

virtual_network = {
  name_vnet     = "infra-vnet-01"
  address_space = "192.168.0.0/16"
}

default_tags = {
  environment = "Lab"
  designation = "Infrastructure"
  provisioner = "Terraform"
}
