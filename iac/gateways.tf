# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Igw"
    Environment = "${var.env}"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT-gw"
    Environment = "${var.env}"
  }

  depends_on = [aws_internet_gateway.igw]
}


# Elastic ip for NAT 
resource "aws_eip" "eip" {
  domain   = "vpc"
}