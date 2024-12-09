terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example" {
  ami           = "ami-0ebfd941bbafe70c6"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Ec2 Example"
  }
}
