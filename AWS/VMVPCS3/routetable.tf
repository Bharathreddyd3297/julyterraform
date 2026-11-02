resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
     }
}


resource "aws_route_table_association" "rtba" {
  count = 2
  route_table_id = aws_route_table.rtb.id
  subnet_id = aws_subnet.subnet[count.index].id
}