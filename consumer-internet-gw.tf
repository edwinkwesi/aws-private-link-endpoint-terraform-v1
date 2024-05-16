resource "aws_internet_gateway" "consumer-internet-gw" {
  vpc_id = aws_vpc.consumer-vpc.id
  tags = {
    Name = "consumer-internet-gateway"
  }

}
