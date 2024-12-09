# This Terraform configuration defines an AWS EC2 instance resource.
# 
# Resource:
# - aws_instance "web": Creates an EC2 instance with the specified attributes.
#
# Attributes:
# - ami: The Amazon Machine Image (AMI) ID to use for the instance. In this case, it is set to "ami-0915bcb5fa77e4892" which corresponds to Amazon Linux.
# - instance_type: The type of instance to create. Here, it is set to "t2.micro".
# - availability_zone: The availability zone in which to launch the instance. It is set to "us-east-1a" (with an alternative commented out for "us-east-1b").
# - tags: A map of tags to assign to the instance. The "Name" tag is set to "web-1".
#
# Meta-Argument:
# - lifecycle: Specifies the lifecycle settings for the resource.
#   - create_before_destroy: Ensures that a new instance is created before the old one is destroyed during updates. This is set to true.
# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-0915bcb5fa77e4892" # Amazon Linux
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
  tags = {
    "Name" = "web-1"
  }
 
  lifecycle {
    create_before_destroy = true
  }

}