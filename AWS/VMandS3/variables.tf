variable "primary_region" {
  type = string
  default = "ap-south-1"
}

variable "secondary_region" {
  type = string
  default = "ap-south-2"
}

variable "instance_type" {
  description = "ec2 instance type"
  type = string
  default = "t3.micro"
}

variable "bucket_name" {
  type = string
}

variable "primary_ami" {
  type =  string
}

variable "secondary_ami" {
  type =  string
}