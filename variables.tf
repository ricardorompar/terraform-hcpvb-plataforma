variable "boundary_cluster_id" {
  description = "The ID of the HCP Boundary cluster."
  type        = string
  default     = "boundary-cluster"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-hvn"
}

variable "vault_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "vault-cluster"
}

variable "peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "peering"
}

variable "route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "dhvn-route"
}

variable "region" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = "eu-west-2"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "aws"
}

variable "vault_tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "development"
}

variable "boundary_tier" {
  description = "Tier of the HCP Boundary cluster. Valid options for tiers."
  type        = string
  default     = "plus"
}

variable "aws_vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "hcp_client_id" {
    type = string
}

variable "hcp_client_secret" {
    type = string
}
