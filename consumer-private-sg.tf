resource "aws_security_group" "consumer-sg" {
    name   = "SSH Access from bastion"
    vpc_id      = aws_vpc.consumer-vpc.id

  

  ingress {
    # description     = "SSH From Anywhere or Your-IP"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.consumer-pub-ec2-sg.id]
  }
}
