# This Terraform configuration performs the following actions:
# 
# 1. Creates an S3 bucket using the `aws_s3_bucket` resource.
#    - The bucket name is specified by the `var.bucket_name` variable.
#
# 2. Sets ownership controls for the S3 bucket using the `aws_s3_bucket_ownership_controls` resource.
#    - The bucket ownership is set to "BucketOwnerPreferred".
#
# 3. Configures the Access Control List (ACL) for the S3 bucket using the `aws_s3_bucket_acl` resource.
#    - The ACL is set to "private".
#    - This resource depends on the ownership controls being set first.
#
# 4. Creates an EC2 instance using the `aws_instance` resource.
#    - The AMI ID and instance type are specified by the `var.ami_id` and `var.instance_type` variables, respectively.
#    - The instance is tagged with a name specified by the `var.instance_name` variable.
#    - The S3 bucket name is written to a file (`/tmp/bucket_info.txt`) on the EC2 instance as an environment variable using user data.
# Create an S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# Ownership Controls for S3 Bucket
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.bucket.id
  
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# ACL for S3 Bucket
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_ownership]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

# Create an EC2 Instance
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  # Attach the S3 bucket name as an environment variable
  user_data = <<-EOF
              #!/bin/bash
              echo "Bucket name: ${aws_s3_bucket.bucket.bucket}" > /tmp/bucket_info.txt
              EOF
}
