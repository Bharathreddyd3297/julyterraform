# Azure variables

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "azure_vm_count" {
  description = "Number of Azure VMs to create"
  type        = number
}

variable "azure_vm_size" {
  description = "The size of the Azure VMs"
  type        = string
}

variable "azure_admin_username" {
  description = "The admin username for the Azure VMs"
  type        = string
}

variable "azure_admin_password" {
  description = "The admin password for the Azure VMs"
  type        = string
  sensitive   = true
}

variable "azure_storage_account_name_prefix" {
  description = "The name of the Azure Storage Account"
  type        = string
}

variable "azure_storage_account_count" {
  description = "Number of Azure Storage Accounts to create"
  type        = number
}

# AWS Variables

variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "aws_vm_count" {
  description = "Number of AWS VMs to create"
  type        = number
}

variable "aws_instance_type" {
  description = "The type of AWS EC2 instances"
  type        = string
}

variable "aws_ami_id" {
  description = "The AMI ID for the AWS EC2 instances"
  type        = string
}

variable "aws_bucket_prefix" {
  description = "The prefix for the AWS S3 bucket names"
  type        = string
}

variable "aws_bucket_count" {
  description = "Number of AWS S3 buckets to create"
  type        = number
}

