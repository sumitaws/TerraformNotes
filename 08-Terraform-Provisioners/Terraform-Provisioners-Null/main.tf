# This Terraform configuration file provisions an AWS EC2 instance and uses a null_resource to run local and remote commands on the instance.
# 
# Resources:
# - aws_instance.example: Provisions an EC2 instance using the specified AMI, instance type, and key pair.
# - null_resource.provisioner_example: Uses provisioners to execute commands on the EC2 instance.
# 
# Provisioners:
# - local-exec: Executes a local command to print the public IP of the EC2 instance.
# - remote-exec: Connects to the EC2 instance via SSH and runs a series of commands to update the system, install Apache HTTP server, and start and enable the service.
# 
# Outputs:
# - instance_public_ip: Outputs the public IP address of the EC2 instance.
# main.tf

resource "aws_instance" "example" {
  ami           = var.aws_ami_type  # Replace with valid Linux AMI
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name         # Ensure you have this key pair in AWS

  tags = {
    Name = "Terraform-Null-Resource-Example"
  }
}

# null_resource.tf

resource "null_resource" "provisioner_example" {
  triggers = {
    instance_id = aws_instance.example.id
  }

  provisioner "local-exec" {
    command = "echo 'AWS EC2 instance ${aws_instance.example.public_ip} is up!'"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.example.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}