data "azurerm_client_config" "current" {}

resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

resource "random_pet" "key_vault_name" {
  prefix    = "kv"
  separator = "-"
}

resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

resource "azapi_resource" "ssh_public_key" {
  provider = azapi.alias1
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = azurerm_resource_group.rg.location
  parent_id = azurerm_resource_group.rg.id
}

resource "azurerm_key_vault" "site_secrets" {
  name                = random_pet.key_vault_name.id
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "standard"

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Backup",
      "Recover",
      "Restore",
      "Delete",
      "Purge",
    ]
  }
}

resource "azurerm_key_vault_secret" "ssh_private_key" {
  name         = "ssh-private-key"
  value        = azapi_resource_action.ssh_public_key_gen.output.privateKey
  key_vault_id = azurerm_key_vault.site_secrets.id
}

resource "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-username"
  value        = var.username
  key_vault_id = azurerm_key_vault.site_secrets.id
}

resource "azurerm_key_vault_secret" "vm_ip_address" {
  name         = "vm-ip-address"
  value        = azurerm_public_ip.site_public_ip.ip_address
  key_vault_id = azurerm_key_vault.site_secrets.id
}

output "key_vault_name" {
  value = random_pet.key_vault_name.id
}