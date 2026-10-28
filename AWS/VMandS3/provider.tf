terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.5" 
    }
  }
}

provider "aws" {
region = var.primary_region
}

provider "aws" {
  alias = "hyd"
  region = var.secondary_region
}