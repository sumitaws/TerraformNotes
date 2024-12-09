variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}



variable "usernames_set" {
  # This variable is defined as a set of strings. A set is an unordered collection
  # of unique string values. This can be useful for defining a collection of items
  # where the order does not matter and duplicates are not allowed.
  type        = set(string)
  description = "Set of IAM usernames"
  default     = ["user1", "user2", "user3"]
}
