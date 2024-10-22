# Declare the required providers and their version constraints for this Terraform configuration
terraform {
  cloud {
    organization = "r2-org"
    workspaces {
      name = "boundary-vault-plataforma"
    }
  }
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.1.15"
    }
    hcp = {
      source = "hashicorp/hcp"
      version = "~>0.89"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
}
