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
}

variable "client_secret" {
  type        = string
  description = "The client secret of the Azure AD application."
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the Azure AD application."
}

variable "subscription_id" {
  type        = string
  description = "The subscription ID for the Azure account."
}