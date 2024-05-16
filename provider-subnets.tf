#1st Public Subnet for aws-service-provider
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.service-provider.id
  cidr_block              = "11.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "provider-public-subnet-2a"
  }
}


#2nd Public Subnet for aws-service-provider
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.service-provider.id
  cidr_block              = "11.0.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "provider-public-subnet-2b"
  }
}

#1st Private Subnet for aws-service-provider
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.service-provider.id
  cidr_block              = "11.0.3.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "provider-private-subnet-2a"
  }
}


#2nd Private Subnet for service provider
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.service-provider.id
  cidr_block              = "11.0.4.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "provider-private-subnet-2b"
  }
}