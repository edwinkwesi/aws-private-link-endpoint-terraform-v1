resource "aws_security_group" "provider-sg" {
    name   = "SSH Access from bastion"
    vpc_id      = aws_vpc.service-provider.id

  

  ingress {
    # description     = "SSH From Anywhere or Your-IP"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.provider-pub-ec2-sg.id]
  }
}


resource "aws_security_group" "nlb-security-group" {
  name        = "NLB-Security-Group"
  vpc_id      = aws_vpc.service-provider.id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#   tags = {
#     Name = "nlb-security-group"

#     }
}