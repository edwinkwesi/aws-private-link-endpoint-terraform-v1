resource "aws_nat_gateway" "nat-gw" {
  allocation_id     = aws_eip.eip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public_subnet_1.id

  tags = {
    Name = "provider-private-natgw"
  }

  depends_on = [aws_internet_gateway.provider-internet-gw]
}
