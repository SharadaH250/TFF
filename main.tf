provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "instance-1" {
    ami = "ami-037774efca2da0726"
    instance_type = "t2.micro"
    count = "1"
    security_groups = ["default"]
    key_name = "test-MD"
    tags = {
      Name = "grafan"
    }
}

resource "aws_instance" "instance-2" {
    ami = "ami-037774efca2da0726"
    instance_type = "t2.micro"
    count = "1"
    security_groups = ["default"]
    key_name = "test-MD"
    tags = {
      Name = "Node-port"
    }
}
