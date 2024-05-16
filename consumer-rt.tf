resource "aws_route_table" "consumer-public-rt" {
  vpc_id = aws_vpc.consumer-vpc.id

  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.consumer-internet-gw.id
  }

  tags = {
    Name = "consumer-public-rt"
  }

}

# ----------------------------------------------------------------

resource "aws_route_table" "consumer-private-rt" {
  vpc_id = aws_vpc.consumer-vpc.id

  
  # Removes routes to internet after updaes of private ec2 instance in private az
  route = []
  
  #   Allows routes to the internet for updates ONLY.   Disable once the updates is complete
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.nat-gw.id
  # }

  tags = {
    Name = "consumer-private-rt"
  }

}

# -------------------------------------------------------------Public route association
resource "aws_route_table_association" "consumer-pub-rt-asscociation-1" {
  subnet_id      = aws_subnet.consumer_public_subnet_1.id
  route_table_id = aws_route_table.consumer-public-rt.id
}

resource "aws_route_table_association" "consumer-pub-rt-asscociation-2" {
  subnet_id      = aws_subnet.consumer_public_subnet_2.id
  route_table_id = aws_route_table.consumer-public-rt.id
}

# --------------------------------------------------------------Private route association

resource "aws_route_table_association" "consumer-private-rt-asscociation-1" {
  subnet_id      = aws_subnet.consumer_private_subnet_1.id
  route_table_id = aws_route_table.consumer-private-rt.id
}

resource "aws_route_table_association" "consumer-private-rt-asscociation-2" {
  subnet_id      = aws_subnet.consumer_private_subnet_2.id
  route_table_id = aws_route_table.consumer-private-rt.id
}

