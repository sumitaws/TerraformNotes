# This file defines two variables for the Terraform configuration:
# 1. `aws_region`: A string variable with a default value of "us-east-1" and a description indicating it represents the AWS region.
# 2. `usernames`: A list of strings variable intended to hold IAM usernames, with a description indicating it is a list of IAM usernames. The default value is a list containing user1, user2, and user3.
variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}

variable "usernames" {
  type = list(string) // Iterate list 
  description = "list of IAM usernames"
  default = [user1, user2, user3]


}