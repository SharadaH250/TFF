provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "instance-1" {
    ami = "ami-05576a079321f21f8"
    instance_type = "t2.micro"
    count = "1"
    security_groups = ["default"]
    key_name = "tf"
    tags = {
      Name = "grafan"
    }
}

resource "aws_instance" "instance-2" {
    ami = "ami-05576a079321f21f8"
    instance_type = "t2.micro"
    count = "1"
    security_groups = ["default"]
    key_name = "tf"
    tags = {
      Name = "Node-port"
    }
}
