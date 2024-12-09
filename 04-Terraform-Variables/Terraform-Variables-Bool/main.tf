# This Terraform configuration defines an AWS EC2 instance resource.
# 
# - `ami`: The Amazon Machine Image (AMI) ID to use for the instance, provided by the variable `aws_ami_type`.
# - `instance_type`: The type of instance to create, provided by the variable `aws_instance_type`.
# - `count`: The number of instances to create, provided by the variable `instance_count`.
# - `associate_public_ip_address`: Whether to associate a public IP address with the instance, provided by the variable `enable_public_ip`.
# - `tags`: A map of tags to assign to the instance. In this case, the instance is tagged with the name "terraform_ec2".
resource "aws_instance" "terraform_ec2" {
  ami           = var.aws_ami_type
  instance_type = var.aws_instance_type
  count = var.instance_count
  associate_public_ip_address = var.enable_public_ip 

    tags = {
        Name = "terraform_ec2"
    }
}
