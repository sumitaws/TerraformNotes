# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type = string  
  default = "ami-0fff1b9a61dec8a5f"
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"
}