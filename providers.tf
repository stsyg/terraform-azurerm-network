terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.24.0"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
  backend "azurerm" {
    resource_group_name  = "infra-storage-rg"
    storage_account_name = "infrastoraged103"
    container_name       = "infrastoragetfstate"
    key                  = "lab.infranetwork.tfstate"
  }
  required_version = ">= 1.3.2"
}

provider "azurerm" {
  features {}
}