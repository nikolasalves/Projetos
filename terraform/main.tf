# Configurando Terraform

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configurando AWS

provider "aws" {
  region = "us-east-1"
}