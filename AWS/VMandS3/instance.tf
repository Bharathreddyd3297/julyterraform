resource "aws_instance" "primary" {
  ami = var.primary_ami
  instance_type = var.instance_type
  tags = {
    name = "Terraform-vm-primary"
    Environment= "development"
  }
}

resource "aws_instance" "secondary" {
  provider = aws.hyd
  ami = var.secondary_ami
  instance_type = var.instance_type
  tags = {
    name = "Terraform-vm-secondary"
    Environment= "development"
  }
}