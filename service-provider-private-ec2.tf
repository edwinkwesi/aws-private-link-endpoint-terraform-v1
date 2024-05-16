resource "aws_instance" "private-ec2" {
    ami           = "ami-01f10c2d6bce70d90"
    instance_type = "t2.micro"

    key_name                    = "service-provider-private-ec2-key-16-05-2024"
    subnet_id                   = aws_subnet.private_subnet_1.id
    vpc_security_group_ids      = [aws_security_group.provider-pub-ec2-sg.id]
    associate_public_ip_address = false

    user_data = filebase64("user-data.sh")
    
    tags = {
        Name = "provider-private-ec2"
    }

}