# This Terraform configuration file sets up the following resources:
#
# 1. EC2 Instance:
#    - Resource: aws_instance.test
#    - AMI: ami-052efd3df9dad4825
#    - Instance Type: t2.micro
#    - Public IP: Enabled
#    - Security Group: aws_security_group.test
#    - Tags: Name (from variable var.name)
#
# 2. Security Group:
#    - Resource: aws_security_group.test
#    - Name: (from variable var.name)
#    - Description: Allow TLS inbound traffic
#    - Ingress Rule: Allows TCP traffic on port 80 from any IP (0.0.0.0/0)
#    - Egress Rule: Allows all outbound traffic
#    - Tags: Name (from variable var.name)
#
# 3. S3 Bucket:
#    - Resource: aws_s3_bucket.b
#    - Bucket Name: Lowercase of var.name with suffix "-test-bucket-state-file"
#    - Force Destroy: Enabled
#
# 4. S3 Bucket ACL:
#    - Resource: aws_s3_bucket_acl.acl
#    - Bucket: aws_s3_bucket.b.id
#    - ACL: Private
#
# 5. DynamoDB Table:
#    - Resource: aws_dynamodb_table.lock
#    - Table Name: terraform-lock
#    - Read Capacity: 5
#    - Write Capacity: 5
#    - Hash Key: LockID
#    - Attribute: LockID (Type: String)
#
# Note: Ensure that the user or role running Terraform has the necessary IAM permissions for S3 (s3:GetObject, s3:PutObject, etc.) and DynamoDB (dynamodb:PutItem, dynamodb:GetItem, etc.).
################### EC2 INSTANCE ###########################
resource "aws_instance" "test" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.test.name]
  tags = {
    Name = var.name
  }
}
################### SECURITY GROUP ##########################
resource "aws_security_group" "test" {
  name        = var.name
  description = "Allow TLS inbound traffic"
  ingress {
    description = "allow access to web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.name
  }
}
################### S3 BUCKET ##############################
resource "aws_s3_bucket" "b" {
  bucket = lower("${var.name}-test-bucket-state-file")
  force_destroy = true
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_dynamodb_table" "lock" {
  name           = "terraform-lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

##IAM Permissions: Ensure that the user or role running Terraform has the necessary IAM permissions for S3 (s3:GetObject, s3:PutObject, etc.) and DynamoDB (dynamodb:PutItem, dynamodb:GetItem, etc.).