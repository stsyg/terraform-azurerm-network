# Deployment of Azure vNet/Subnets

The following resources will be created:

- Azure vNet
- Azure Subnets
  - Azure Bastion Subnet
- Azure Bastion
- NSG
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_network_security_group.infransg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.infrabastionpip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.bastionrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.infrarg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.infrasubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.infravnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host_name"></a> [bastion\_host\_name](#input\_bastion\_host\_name) | Azure Bastion Host name | `string` | n/a | yes |
| <a name="input_bastion_pip_name"></a> [bastion\_pip\_name](#input\_bastion\_pip\_name) | Azure Bastion Public IP name | `string` | n/a | yes |
| <a name="input_bastion_rg_name"></a> [bastion\_rg\_name](#input\_bastion\_rg\_name) | Name of the Bastion Resource group | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to add to deployed resources | `map(string)` | n/a | yes |
| <a name="input_deploy_location"></a> [deploy\_location](#input\_deploy\_location) | The Azure Region in which all resources will be created | `string` | n/a | yes |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | Azure Bastion IP configuration name | `string` | n/a | yes |
| <a name="input_network_security_group"></a> [network\_security\_group](#input\_network\_security\_group) | Name of the NSG | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the Resource group | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets | `map(any)` | <pre>{<br>  "bastion_subnet": {<br>    "address_prefixes": [<br>      "192.168.255.224/27"<br>    ],<br>    "name": "AzureBastionSubnet"<br>  },<br>  "subnet_1": {<br>    "address_prefixes": [<br>      "192.168.0.0/24"<br>    ],<br>    "name": "infra-lab-front"<br>  },<br>  "subnet_2": {<br>    "address_prefixes": [<br>      "192.168.1.0/24"<br>    ],<br>    "name": "infra-lab-back"<br>  },<br>  "subnet_3": {<br>    "address_prefixes": [<br>      "192.168.2.0/24"<br>    ],<br>    "name": "infra-lab-k8s"<br>  },<br>  "subnet_4": {<br>    "address_prefixes": [<br>      "192.168.255.192/27"<br>    ],<br>    "name": "GatewaySubnet"<br>  }<br>}</pre> | no |
| <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network) | Name of vNet/Subnet resources | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
