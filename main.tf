provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_instances" {
  ami           = "ami-08a52ddb321b32a8c"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstances"
  }
}
