resource "aws_instance" "public-ec2" {
  ami           = "ami-01f10c2d6bce70d90"
  instance_type = "t2.micro"

  key_name                    = "service-provider-public-ec2-key"
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.provider-pub-ec2-sg.id]
  associate_public_ip_address = true


  tags = {
    Name = "bastion-provider-public-ec2"
  }

}