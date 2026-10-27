variable "location" {
  description = "Location"
  type        = string
}

variable "rgname" {
  description = "resource group name"
  type        = string
}

variable "vm_name" {
  description = "virtual machine name"
  type = string
}

variable "admin_username" {
  description = "adminusername for VM's"
  type = string
}


variable "admin_password" {
  description = "SSH Key"
  type = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type = string
}