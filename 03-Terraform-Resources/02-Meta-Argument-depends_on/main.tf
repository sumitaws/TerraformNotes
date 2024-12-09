# This Terraform configuration does the following:
# 
# 1. Configures the AWS provider to use the "us-east-1" region.
# 
# 2. Creates an S3 bucket named "example-bucket-2024".
# 
# 3. Creates an IAM role named "example-role" with a trust policy that allows EC2 instances to assume the role.
# 
# 4. Attaches an IAM policy named "example-policy" to the IAM role, granting it full access to S3 resources.
# 
# 5. Launches an EC2 instance using the Amazon Linux 2 AMI and "t2.micro" instance type.
# 
# 6. Ensures that the EC2 instance creation explicitly depends on the S3 bucket and the IAM role with the attached policy.
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-2024"
}

# Create an IAM role
resource "aws_iam_role" "example" {
  name               = "example-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach an IAM policy to the role
resource "aws_iam_role_policy" "example" {
  name   = "example-policy"
  role   = aws_iam_role.example.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = "s3:*"
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  # Explicitly ensure the EC2 instance depends on the S3 bucket and IAM role with the policy
  depends_on = [
    aws_s3_bucket.example,
    aws_iam_role_policy.example
  ]
}
