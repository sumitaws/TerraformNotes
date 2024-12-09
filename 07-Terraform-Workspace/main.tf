/*
1. Terraform Configuration File
Create a main.tf file with the following content:

${terraform.workspace} is a built-in Terraform variable that dynamically gets the name of the current workspace.
This configuration creates an S3 bucket whose name is prefixed with the active workspace name.

2. Initialize the Terraform Configuration
      terraform init
3. Create a New Workspace
Create separate workspaces for different environments (e.g., dev, staging, prod):
      terraform workspace new dev
      terraform workspace new staging
      terraform workspace new prod
      You can list all workspaces using:
            terraform workspace list

4. Switch Between Workspaces
Switch between workspaces using:
      terraform workspace select dev
      terraform workspace select staging
      terraform workspace select prod
You can verify the current workspace using:
      terraform workspace show

5. Apply the Terraform Configuration
Apply the Terraform configuration to create the S3 bucket:
      terraform apply
For the dev workspace, Terraform will create an S3 bucket named dev-example-bucket. Similarly, for staging, it will create staging-example-bucket, and so on.
6. Destroy Resources for a Workspace
Destroy the resources for a specific workspace using:
      terraform destroy
*/

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "${terraform.workspace}-example-bucket"
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

