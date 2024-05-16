resource "aws_internet_gateway" "provider-internet-gw" {
  vpc_id = aws_vpc.service-provider.id
  tags = {
    Name = "provider-internet-gateway"
  }

}
