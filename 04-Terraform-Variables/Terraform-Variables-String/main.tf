resource "aws_instance" "terraform_ec2" {
    ami           = var.aws_ami_type
    instance_type = var.aws_instance_type

    tags = {
        Name = "terraform_ec2"
    }
}
