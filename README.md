# HCP Boundary / Vault Plataforma

This configuration is cloned from the great [repo](https://github.com/jm-merchan/Simple_Boundary_Demo) by [Jose](https://github.com/jm-merchan) with some slight modifications to be run in HCP Terraform.

---

This module contains all the basic resources for Boundary and Vault in HCP

With these Terraform files you'll create:
1. An HCP Boundary cluster
2. HCP Vault cluster
3. A VPC for peering between AWS and HCP
4. ARN for that VPC
5. A security group to allow traffic for Vault, Postgres and LDAP.
6. A HashiCorp Virtual Network (HVN) for the Boundary and Vault clusters
7. Peering connection between that HVN and the AWS VPC
8. HVN route
9. A peering connection accepter for the VPC

> This is configuration is intended to be used in HCP Terraform. For this you will need to [create a service principal](https://developer.hashicorp.com/hcp/docs/hcp/iam/service-principal/key) and enter your HCP credentials in a terraform.tfvars file, for example.

This "Plataforma" project contains the code to build a Vault and Boundary cluster in HCP together with a VPC in your AWS account. That VPC gets connected to HCP (where Vault is deployed) by means of a VPC peering with an HVN. 

After deploying the infrastructure we set a few environment variables that are required for the different use cases with Boundary and Vault. 

Finally, we authenticate with Boundary using the credentials we have defined within the `terraform.tfvars` file.

```bash
cd 1_Plataforma/

<export AWS Creds>

terraform login
# Create and enter your HCP TF token interactively with the browser.

terraform init
# Automatically logs in to HCP with the hcp_client_id and hcp_client_secret variables
terraform apply -auto-approve
export BOUNDARY_ADDR=$(terraform output -raw boundary_public_url)
export VAULT_ADDR=$( terraform output -raw vault_public_url)
export VAULT_NAMESPACE=admin
export VAULT_TOKEN=$(terraform output -raw vault_token)
# Log to boundary interactively using password Auth with admin user
boundary authenticate
export TF_VAR_authmethod=$(boundary auth-methods list -format json | jq -r '.items[0].id')
```

