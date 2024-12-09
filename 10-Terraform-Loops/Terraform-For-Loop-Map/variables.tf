variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}

variable "env_instance_types" {
  type = map(string)
  default = {
    "dev"  = "t2.micro"
    "test" = "t2.small"
    "prod" = "t3.medium"
  }
}

output "env_description_map" {
  value = { for env, type in var.env_instance_types : env => "${env} uses ${type}" }
}


# output would be like this for map
# {
#   "dev"  = "dev uses t2.micro",
#   "test" = "test uses t2.small",
#   "prod" = "prod uses t3.medium"
# }



### for conditional env
output "filtered_env_map" {
  value = { for env, type in var.env_instance_types : env => type if env != "test" }
}

#output would be conditional
# {
#   "dev"  = "t2.micro",
#   "prod" = "t3.medium"
# }