deploy_location        = "canadacentral"
rg_name                = "infra-network-rg"
network_security_group = "infra-network-nsg"

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
    name   = "infra-lab-front"
    number = 1
  },
  {
    name   = "infra-lab-back"
    number = 2
  },
  {
    name   = "infra-lab-k8s"
    number = 3
  },
]