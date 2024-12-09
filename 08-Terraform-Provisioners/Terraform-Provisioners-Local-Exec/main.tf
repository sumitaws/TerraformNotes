resource "aws_instance" "example" {
  ami           = var.aws_ami_type   # Replace with a valid AMI ID
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name        # Ensure you have this key pair in your AWS account

  provisioner "local-exec" {
    command = "./notify.sh ${self.public_ip}"
  }

  tags = {
    Name = "Terraform-Local-Exec-Script"
  }
}
