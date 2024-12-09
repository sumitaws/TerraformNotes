variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}

variable "names" {
  type = list(string)
  default = ["Sumit", "Rohit", "Ashu"]
}

output "uppercased_names" {
  value = [for name in var.names : upper(name)]
}