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
variable "enable_public_ip" {
  description = "Enableing public ip for ec2"
  type = bool
  default = true
  
}
variable "username" {
  description = "Username for ec2 instance"
  type = list(string) // ---> Variable type list of strings
  default = [user1, user2, user3]
  
}
variable "availability_zones" {
  type        = list(string) // --> Variable type list of strings
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

