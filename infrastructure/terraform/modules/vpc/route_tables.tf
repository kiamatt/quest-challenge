resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

resource "aws_route_table_association" "rta-public-0" {
  subnet_id      = aws_subnet.public0.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "rta-public-1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.gw.id
}

resource "aws_route_table_association" "rta-private0" {
  subnet_id      = aws_subnet.private0.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "rta-private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "rta-private2" {
  subnet_id      = aws_subnet.private_app_0.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "rta-private3" {
  subnet_id      = aws_subnet.private_app_1.id
  route_table_id = aws_route_table.private-rt.id
}
