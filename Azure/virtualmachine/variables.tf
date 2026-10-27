variable "location" {
  description = "Default location for azure resources"
  type = string
  default = "canadacentral"
}

variable "environments" {
  description = "Map of env and vm sizes"
  type = map(string)
  default = {
    "dev" = "Standard_B1s"
    "qa" = "Standard_B1s"
    "prod" = "Standard_B2s"
  }
}

variable "admin_username" {
  description = "adminusername for VM's"
  type = string
  default = "devopsuser"
}

variable "ssh_publickey_path" {
  description = "SSH Key"
  type = string
  default = "C:/Users/user/.ssh/azure_vm_key.pub"
}

# variable "admin_password" {
#   description = "SSH Key"
#   type = string
#   default = "Password@1234!"
# }