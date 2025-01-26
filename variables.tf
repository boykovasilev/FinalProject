variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "boyko"
}

variable "subscription_id" {
  type        = string
  description = "The subscription ID for the Azure account."
  default = "affa400c-9132-43d6-b147-841e4a5b033f"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account used for the Terraform state file."
}

