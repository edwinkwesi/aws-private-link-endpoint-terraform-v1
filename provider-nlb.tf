resource "aws_lb" "provider_nlb" {
  name               = "service-provider-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  security_groups    = [aws_security_group.nlb-security-group.id]

  enable_deletion_protection = false

  tags = {
    Environment = "service provider"
  }
}