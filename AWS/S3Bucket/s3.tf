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
region = "ap-south-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "groww-terraform-bucket"
  tags = {
    name = "Groww Bucket"
    owner =  "Bharath"
    environment = "Development"
  }
}

# aws configure