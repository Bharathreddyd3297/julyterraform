resource "aws_security_group" "sg" {
  name = "terraform-ec2-sg"
  description = "security group for terraform ec2 instances"
  vpc_id = aws_vpc.vpc.id

  ingress  {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#     egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
}