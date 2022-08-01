resource "aws_subnet" "public0" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 4, 0)
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 4, 1)
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = {
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "private0" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 3)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 4)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_app_0" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 5)
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "private_app_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 6)
  availability_zone = data.aws_availability_zones.available.names[1]
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public0.id
}
