################### OUTPUTS ##############################
output "IpAddress" {
  value = aws_instance.test.public_ip
}
output "BucketName" {
  value = aws_s3_bucket.b.bucket
}