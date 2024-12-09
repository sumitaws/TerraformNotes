# This file contains the variable definitions for the Terraform configuration.
# 
# Variables:
# 
# - aws_region: The AWS region where resources will be created. Default is "us-east-1".
# - aws_instance_type: The EC2 instance type to be used. Default is "t3.micro".
# - aws_ami_type: The AMI ID to be used for the EC2 instance. Default is "ami-0fff1b9a61dec8a5f".
# - aws_key_name: The name of the key pair to be used for the EC2 instance. Default is "terraform-key".
variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}
//Variable type string
variable "aws_instance_type" {
  type        = string //--> Variable type string
  default     = "t3.micro"
  description = "Description about ec2 instance type"

}

variable "aws_ami_type" {
  type        = string
  default     = "ami-0fff1b9a61dec8a5f"
  description = "Description about AMI ID"
}

variable "aws_key_name" {
  type        = string
  default     = "terraform-key"
  description = "Description about key name"
}