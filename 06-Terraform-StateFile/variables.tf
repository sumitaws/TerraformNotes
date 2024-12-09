################### VARIABLES ##############################
variable "name" {
  type    = string
  default = "Terraform-state"
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
variable "aws_region" {
  type = string
  default = "us-east-1"
}