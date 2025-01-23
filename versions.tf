terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
    azapi = {
      alias = "alias1"
      source  = "azure/azapi"
      version = "~>1.5"
      use_oidc = true
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  
}

provider "azurerm" {
  features {}
  subscription_id = "affa400c-9132-43d6-b147-841e4a5b033f"
}