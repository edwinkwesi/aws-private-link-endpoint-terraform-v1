# Creating VPC custom configuration
resource "aws_vpc" "consumer-vpc" {
  cidr_block       = "172.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "consumer-vpc"
  }
}
