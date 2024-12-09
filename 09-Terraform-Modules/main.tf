
# Call the module and pass in values for the input variables
module "ec2_s3_example" {
  source         = "./terraform-modules/ec2_s3"
  
  # Pass in the necessary variables
  ami_id         = "ami-0fff1b9a61dec8a5f"
  instance_type  = "t3.micro"
  instance_name  = "My-EC2-Instance"
  bucket_name    = "my-app-bucket"
}

# Output the values from the module
output "s3_bucket_name" {
  value = module.ec2_s3_example.bucket_name
}

output "ec2_instance_id" {
  value = module.ec2_s3_example.instance_id
}
