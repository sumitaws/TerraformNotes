# Output the S3 bucket name
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.bucket.bucket
}

# Output the EC2 instance ID
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id
  
}
