variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}

variable "usernames" {
  type        = list(string)
  description = "List of IAM usernames"
  default     = ["user1", "user2", "user3"]
}

