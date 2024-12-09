# This Terraform configuration creates an EC2 instance with the specified AMI and instance type.
# The instance is tagged with the name "web-2".
# The lifecycle block includes the prevent_destroy argument set to true, which prevents the instance from being destroyed.
# Create EC2 Instance
resource "aws_instance" "web" {
  ami = "ami-0915bcb5fa77e4892" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "web-2"
  }
  lifecycle {
    prevent_destroy = true # Default is false
  }
}
