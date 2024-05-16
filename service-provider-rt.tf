resource "aws_route_table" "service-provider-public-rt" {
  vpc_id = aws_vpc.service-provider.id

  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.provider-internet-gw.id
  }

  tags = {
    Name = "service-provider-public-rt"
  }

}

# ----------------------------------------------------------------

resource "aws_route_table" "service-provider-private-rt" {
  vpc_id = aws_vpc.service-provider.id

  
  # Removes routes to internet after updaes of private ec2 instance in private az
  route = []
  
  #   Allows routes to the internet for updates ONLY.   Disable once the updates is complete
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.nat-gw.id
  # }

  tags = {
    Name = "service-provider-private-rt"
  }

}

# -------------------------------------------------------------Public route association
resource "aws_route_table_association" "service-provider-pub-rt-asscociation-1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.service-provider-public-rt.id
}

resource "aws_route_table_association" "service-provider-pub-rt-asscociation-2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.service-provider-public-rt.id
}

# --------------------------------------------------------------Private route association

resource "aws_route_table_association" "service-provider-private-rt-asscociation-1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.service-provider-private-rt.id
}

resource "aws_route_table_association" "service-provider-private-rt-asscociation-2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.service-provider-private-rt.id
}

