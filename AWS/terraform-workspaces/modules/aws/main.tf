resource "aws_vpc" "vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "multicloud-vpc"
  }
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.1.1.0/24"
    tags = {
        Name = "multicloud-subnet"
    }
    map_public_ip_on_launch = true
}


resource "aws_security_group" "sg" {
  name = "multicloud-ec2-sg"
  description = "security group for terraform ec2 instances"
  vpc_id = aws_vpc.vpc.id

  ingress  {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "vm" {
  count = var.aws_vm_count
  ami = var.aws_ami_id
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "multicloud-ec2-${count.index + 1}"
  }
}

resource "aws_s3_bucket" "bucket" {
  count = var.aws_bucket_count
  bucket = "${var.aws_bucket_prefix}-${count.index + 1}"
  tags = {
    Name = "multicloud-s3-${count.index + 1}"
  }
}