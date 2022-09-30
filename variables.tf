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
}

variable "bastion_pip_name" {
  type        = string
  description = "Azure Bastion Public IP name"
}

variable "bastion_host_name" {
  type        = string
  description = "Azure Bastion Host name"
}

variable "ip_configuration_name" {
  type        = string
  description = "Azure Bastion IP configuration name"
}