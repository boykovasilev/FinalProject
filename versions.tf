terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

   backend "azurerm" {
      resource_group_name  = "rg_tfstate"
      storage_account_name = var.storage_account_name
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
  
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
