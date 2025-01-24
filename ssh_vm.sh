# #!/bin/bash

# # Retrieve the Key Vault name from Terraform output
KEY_VAULT_NAME=$(terraform output -raw key_vault_name)
echo $KEY_VAULT_NAME
# # Retrieve the private key from Azure Key Vault
PRIVATE_KEY=$(az keyvault secret show --name ssh-private-key --vault-name "$KEY_VAULT_NAME" --query value -o tsv)
echo $PRIVATE_KEY
# # Retrieve the username from Azure Key Vault
VM_USERNAME=$(az keyvault secret show --name vm-username --vault-name "$KEY_VAULT_NAME" --query value -o tsv)
echo $VM_USERNAME
# # Retrieve the IP address from Azure Key Vault
VM_IP_ADDRESS=$(az keyvault secret show --name vm-ip-address --vault-name "$KEY_VAULT_NAME" --query value -o tsv)
echo $VM_IP_ADDRESS
# # Create a temporary file to store the private key
TEMP_KEY_FILE=$(mktemp)
echo "$PRIVATE_KEY" > "$TEMP_KEY_FILE"
chmod 600 "$TEMP_KEY_FILE"

# SSH into the VM
scp -i "$TEMP_KEY_FILE" -r ./ansible "$VM_USERNAME@$VM_IP_ADDRESS":~/ansible  
ssh -i "$TEMP_KEY_FILE" "$VM_USERNAME@$VM_IP_ADDRESS" "sudo apt update;sudo apt install ansible; CF_TOKEN=$CF_TOKEN IP=$VM_IP_ADDRESS ansible-playbook ~/ansible/ansible-playbook.yml"

# # Delete the temporary key file
# rm -f "$TEMP_KEY_FILE"