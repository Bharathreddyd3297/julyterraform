# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {

  #"A provider is Terraform's plugin that knows how to communicate with a platform 
  # such as AWS or Azure. features {} is specific to the AzureRM provider and is 
  # used to configure AzureRM-specific behavior; an empty block simply uses the default behavior."
  features {}
  subscription_id = "eb2e4db4-1889-4351-9b48-102efd8a3a57" # Add your actual subscription ID here
}

# Create Resource Group
resource "azurerm_resource_group" "my_demo_rg6" {
  location = "eastus"
  name     = "my-demo-rg1"

  tags = {
    name        = "development"
    owner       = "Kiran"
    Createdby   = "Bharath"
    Createdon   = "21st Oct 2026"
    environment = "Development"
  }
}