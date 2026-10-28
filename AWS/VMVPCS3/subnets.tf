resource "aws_subnet" "subnet" {
  count = length(var.subnet_cidrs)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = "${var.aws_region}${count.index == 0 || count.index == 2 ? "a" : "b"}"
  map_public_ip_on_launch = count.index < 2
  tags = {
    name = var.subnet_names[count.index]
    type = count.index < 2 ? "Public" : "Private"
  }
}

# count.index = 0 --> public 1--> a
# count.index = 1 --> public 2--> b
# count.index = 2 --> private 1--> a
# count.index = 3 --> private 2--> b