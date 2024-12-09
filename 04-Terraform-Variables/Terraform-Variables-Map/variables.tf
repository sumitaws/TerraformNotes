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

variable "instance_count" {
    description = "Ec2 instance count"
    type = number /// --> Variable type count
    default = 1
  
}

# This variable defines a map of tags to assign to the EC2 instance.
# 
# Type: map(string)
# 
# Description: A map of tags to assign to the EC2 instance.
# 
# Default:
# {
#   Name        = "MyInstance"
#   Environment = "Production"
#   Owner       = "Sumit"
# }
variable "ec2_tags" {
  type        = map(string) //--> Variable type map of strings
  description = "A map of tags to assign to the EC2 instance"
  default     = {
    Name        = "MyInstance"
    Environment = "Production"
    Owner       = "Sumit"
  }
}
