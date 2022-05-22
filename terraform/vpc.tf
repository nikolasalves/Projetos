# Configurando VPC

resource "aws_vpc" "vpc_01" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "vpc1"
  }
}

# Configurando Security Group

resource "aws_security_group" "sg_01" {
  name        = "sg_01"
  description = "Networking rules"
  vpc_id      = aws_vpc.vpc_01.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "ssh"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "lab1"
  }
}