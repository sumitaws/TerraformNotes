terraform{
    required_providers{
 aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
        }
      }
}

provider "aws" {
  region = var.aws_region
  access_key = ""
  secret_key = ""
}