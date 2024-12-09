# Create S3 Bucket - with Input Variables 
/*
resource "aws_s3_bucket" "mys3bucket" {
  bucket = "${var.app_name}-${var.environment_name}-bucket"
  grant {
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
    id          = "your-canonical-user-id"
  }
  tags = {
    Name = "${var.app_name}-${var.environment_name}-bucket"
    Environment = var.environment_name
  }
}
*/

# Define Local Values
locals {
  bucket_name = "${var.app_name}-${var.environment_name}-bucket" # Corrected local variable name and modern interpolation
}

# Create S3 Bucket with ACL (Access Control List)
resource "aws_s3_bucket" "mys3bucket" {
  bucket = local.bucket_name

  # Use ACL for permissions (e.g., private, public-read, etc.)
  acl = "private"

  tags = {
    Name        = local.bucket_name
    Environment = var.environment_name
  }
}
