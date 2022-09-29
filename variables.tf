variable "deploy_location" {
  type        = string
  default     = ""
  description = "The Azure Region in which all resources will be created"
}

variable "rg_name" {
  type        = string
  default     = ""
  description = "Name of the Resource group"
}

variable "network_security_group" {
  type        = string
  default     = ""
  description = "Name of the NSG"
}

variable "default_tags" {
  type = map
  description = "Default tags to add to deployed resources"
}

variable "virtual_network" {
  type = map
  description = "Name of vNet/Subnet resources"
}
