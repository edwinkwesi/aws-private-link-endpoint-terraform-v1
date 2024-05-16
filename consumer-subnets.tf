#1st Public Subnet for aws-service-provider
resource "aws_subnet" "consumer_public_subnet_1" {
  vpc_id                  = aws_vpc.consumer-vpc.id
  cidr_block              = "172.0.5.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "consumer-public-subnet-2a"
  }
}


#2nd Public Subnet for aws-service-provider
resource "aws_subnet" "consumer_public_subnet_2" {
  vpc_id                  = aws_vpc.consumer-vpc.id
  cidr_block              = "172.0.6.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "consumer-public-subnet-2b"
  }
}

#1st Private Subnet for aws-service-provider
resource "aws_subnet" "consumer_private_subnet_1" {
  vpc_id                  = aws_vpc.consumer-vpc.id
  cidr_block              = "172.0.7.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "consumer-private-subnet-2a"
  }
}


#2nd Private Subnet for service provider
resource "aws_subnet" "consumer_private_subnet_2" {
  vpc_id                  = aws_vpc.consumer-vpc.id
  cidr_block              = "172.0.8.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "consumer-private-subnet-2b"
  }
}