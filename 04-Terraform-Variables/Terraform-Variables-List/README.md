# TERRAFORM LIST
In Terraform, a list is a sequence of values, all of the same type, ordered by their position. Lists are zero-indexed, meaning the first element is at index 0. Lists are particularly useful when you need to handle multiple values in your configuration, such as a list of availability zones, subnets, or security group IDs.

Type Syntax:

1. A list of strings: list(string)
2. A list of numbers: list(number)
3. A list of any type: list(any)

You declare a list variable in the variables.tf file using the variable block and specifying the type.
```t
variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to deploy resources into"
}
```
###You can assign values to the list variable in several ways:

1. Default Value in Variable Declaration:
```t
variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
```
2. terraform.tfvars File:
```t
availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
```

3. Command Line Flags:
```t
terraform apply -var 'availability_zones=["us-west-2a","us-west-2b","us-west-2c"]'
