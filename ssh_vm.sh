# Retrieve the Key Vault name from Terraform output
KEY_VAULT_NAME=$(terraform output -raw key_vault_name)

# Retrieve private key, username and IP from Azure Key Vault
PRIVATE_KEY=$(az keyvault secret show --name ssh-private-key --vault-name "$KEY_VAULT_NAME" --query value -o tsv)
VM_USERNAME=$(az keyvault secret show --name vm-username --vault-name "$KEY_VAULT_NAME" --query value -o tsv)
VM_IP_ADDRESS=$(az keyvault secret show --name vm-ip-address --vault-name "$KEY_VAULT_NAME" --query value -o tsv)

# Create a temporary file to store the private key
TEMP_KEY_FILE=$(mktemp)
echo "$PRIVATE_KEY" > "$TEMP_KEY_FILE"
chmod 600 "$TEMP_KEY_FILE"

# Prepare key requirements for SSH
mkdir -p ~/.ssh/ && touch ~/.ssh/known_hosts
ssh-keyscan $VM_IP_ADDRESS >> ~/.ssh/known_hosts
eval $(ssh-agent)
ssh-add - <<< "$PRIVATE_KEY"     

# Transfer Ansible Files
scp -i "$TEMP_KEY_FILE" -o UserKnownHostsFile=~/.ssh/known_hosts -r ./ansible "$VM_USERNAME@$VM_IP_ADDRESS":~/ansible 

# Execute Ansible Files Locally
ssh -i "$TEMP_KEY_FILE" -o UserKnownHostsFile=~/.ssh/known_hosts "$VM_USERNAME@$VM_IP_ADDRESS" "sudo apt update;sudo apt install -y ansible; GITHUB_TOKEN=$GITHUB_TOKEN CF_TOKEN=$CF_TOKEN IP=$VM_IP_ADDRESS ansible-playbook ~/ansible/ansible-playbook.yml"
