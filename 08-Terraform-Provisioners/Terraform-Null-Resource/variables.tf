variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}
//Variable type string
variable "aws_instance_type" {
  type        = string //--> Variable type string
  default     = "t2.micro"
  description = "Description about ec2 instance type"

}

variable "aws_ami_type" {
  type        = string
  default     = "ami-0fff1b9a61dec8a5f"
  description = "Description about AMI ID"
}

variable "aws_ami_type" {
  type        = string
  default     = "ami-0fff1b9a61dec8a5f"
  description = "Description about AMI ID"
}
