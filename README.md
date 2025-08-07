# Proxmox-terraform

This project provides a set of Terraform configurations to create virtual machines on a Proxmox host. It's designed to be a foundational setup for managing infrastructure as code (IaC) on Proxmox, with support for various operating systems like Windows, Linux, etc.

## Usage

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/Proxmox-terraform.git
    cd Proxmox-terraform
    ```

2.  **Configure your Proxmox provider:**
    Create a `terraform.tfvars` file and add your Proxmox API credentials:
    ```terraform
    pm_api_url = "https://your-proxmox-host:8006/api2/json"
    pm_api_token_id = "your-api-token-id"
    pm_api_token_secret = "your-api-token-secret"
    ```

3.  **Customize your VM configurations:**
    Modify the `variables.tf` file to define the virtual machines you want to create.

4.  **Initialize and apply Terraform:**
    ```bash
    terraform init
    terraform apply
    ```
