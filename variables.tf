variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources will be created"
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group"
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
}
