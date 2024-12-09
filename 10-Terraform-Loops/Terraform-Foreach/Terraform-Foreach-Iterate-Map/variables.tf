variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}

variable "user_info" {
  type = map(string)
  description = "Map of IAM usernames and their respective teams"
  default = {
    "user1" = "TeamA"
    "user2" = "TeamB"
    "user3" = "TeamC"
  }
}