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

terraform {
  backend "s3" {
    bucket         = "terraform-state-test-bucket-state-file"  # Name of the S3 bucket for storing state
    key            = "terraform.tfstate"                       # Path to the state file within the bucket
    region         = "us-east-1"                               # Region for the S3 bucket
    dynamodb_table = "terraform-lock"                          # DynamoDB table for state locking
  }
}
