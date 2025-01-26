# FinalProject

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction
FinalProject is a Terraform project that automates the deployment of infrastructure that could host a website on Azure. It includes configurations for virtual machines, storage accounts, and networking.

## Features
- Automated deployment of Azure resources
- Configurable infrastructure settings
- Both the infrastructure and its configuration is kept as a code in the repo along with the site(project you want to deploy)
- Integration with GitHub Actions for CI/CD

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- Domain managed on Cloudflare (https://www.cloudflare.com/)
- Azure subscription

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/FinalProject.git
    cd FinalProject
    ```
2. Make the necessary adjustments and add the needed secrets (see configuration)

## Usage
1. Plan the infrastructure changes if oyu wish to make any and update vm.tf.
2. If additional config changes on the machine are needed edit the ansible file accordingly. 
3. Open actions -> Terraform Apply for Azure -> Run workflow 
   

## Configuration
Configure the project by editing the [variables.tf] file. Set the necessary variables such as `resource_group_name`, `storage_account_name`, and others. Make sure to add Tenant ID, subscription ID, Application ID, application secret value, Cloudflare API tokebn and deploy key token. 
[links]
Azure app registration (https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure-openid-connect)
Cloudflare API - (https://developers.cloudflare.com/api/resources/dns/subresources/records/methods/create/)

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/boykovasilev/FinalProject/blob/main/LICENSE) file for details.

## Contact
- Name: Boyko Vasilev
- Email: boyko.i.vasilev@gmail.com
- GitHub: [boykovasilev](https://github.com/boykovasilev)