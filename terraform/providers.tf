# Configurando Subnet

resource "aws_subnet" "subnet_01" {
  vpc_id            = "${aws_vpc.vpc_01.id}"
  cidr_block        = "10.0.0.0/16"
  availability_zone = "us-east-1a"
  tags = {
      Name = "subnet1"
  }
}

# Configurando EC2

resource "aws_instance" "lab" {
    ami = "ami-09d56f8956ab235b3"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.subnet_01.id}"
    key_name = "terraform-aws"
    tags = {
        Name = "dev1"
    }

}