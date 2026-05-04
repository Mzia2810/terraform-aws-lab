resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}



resource "aws_subnet" "private" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}