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

# Trying to fix thge deployment issue:
variable "client_id" {
  type        = string
  description = "The client ID of the Azure AD application."
  default = "8ec181e6-4a2c-4511-92ce-fbd7ac04237e"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the Azure AD application."
  default = "75be9c20-d181-496f-84b7-e2e3c573e467"
}

variable "subscription_id" {
  type        = string
  description = "The subscription ID for the Azure account."
  default = "affa400c-9132-43d6-b147-841e4a5b033f"
}