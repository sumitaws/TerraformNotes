resource "aws_instance" "example" {
  ami           = var.aws_ami_type
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name # Ensure you have this key pair in your AWS account

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa") # Path to your private key
    host        = self.public_ip        # Connect using the instance's public IP
  }

  provisioner "file" {
    source      = "local_script.sh"    # Local file path
    destination = "/tmp/remote_script.sh" # Remote destination on EC2 instance
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/remote_script.sh",
      "/tmp/remote_script.sh"
    ]
  }
  

  tags = {
    Name = "Terraform-File-Provisioner-Demo"
  }
}