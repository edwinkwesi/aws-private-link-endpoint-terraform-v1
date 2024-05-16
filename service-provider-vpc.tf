# Creating VPC custom configuration
resource "aws_vpc" "service-provider" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "service-provider"
  }
}
