resource "aws_instance" "example" {
  ami           = var.aws_ami_type   # Replace with a valid Linux AMI
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name        # Ensure you have this key pair in AWS

  connection {
    type        = "ssh"
    user        = "ec2-user"       # Default user for Amazon Linux
    private_key = file("~/.ssh/id_rsa")  # Path to your private SSH key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }

  tags = {
    Name = "Terraform-Remote-Exec-Linux"
  }
}