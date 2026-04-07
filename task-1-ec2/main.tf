provider "aws" {
  region = "us-east-1"
}

# Dynamically fetch the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id # always latest
  instance_type = "t3.micro"

  tags = {
    Name        = "terraform-web-server"
    Environment = "dev"
  }
}