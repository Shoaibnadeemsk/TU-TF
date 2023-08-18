provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0da59f1af71ea4ad2"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
