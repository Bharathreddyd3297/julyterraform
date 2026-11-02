
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

variable "aws_bucket_count" {
  description = "Number of AWS S3 buckets to create"
  type        = number
}

variable "aws_bucket_prefix" {
  description = "The prefix for the AWS S3 bucket names"
  type        = string
}

