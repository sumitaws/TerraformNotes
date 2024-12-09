# This file defines the variables used in the Terraform configuration.
# 
# Variables:
# 
# - aws_region: Specifies the AWS region to be used. It is a string with a default value of "us-east-1".
# - user_info_map: A map of IAM usernames and their respective tags. It is a map of strings with a default value containing three users and their associated teams.
   
variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}

variable "user_info_map" {
  # This variable is defined as a map with string keys and string values.
  # Maps in Terraform are collections of key-value pairs, where each key is unique.
  # This type is useful for defining variables that need to store multiple related values.
  type = map(string)
  description = "Map of IAM usernames and their respective tags"
  default = {
    "user1" = "TeamA"
    "user2" = "TeamB"
    "user3" = "TeamC"
  }
}

# # Optionally attach policies for each user
# resource "aws_iam_user_policy_attachment" "user_policies" {
#   count      = length(keys(var.user_info_map))
#   user       = aws_iam_user.users[count.index].name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess" # Example policy
# }