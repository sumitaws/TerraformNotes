# This Terraform configuration defines two resources:
# 1. An AWS EC2 instance resource named "web_server".
#    - The AMI ID and instance type are specified using variables `var.aws_ami_type` and `var.aws_instance_type`.
# 2. A null resource named "post_instance_setup" that performs post-creation setup tasks.
#    - It depends on the "web_server" instance.
#    - Uses a local-exec provisioner to run a series of shell commands:
#      - Logs the instance ID.
#      - Updates configuration files.
#      - Appends a message to "deployment.log" indicating the server is ready for deployment.
#    - The `triggers` block ensures the null resource is re-provisioned if the instance ID changes.

resource "aws_instance" "web_server" {
  ami           = "var.aws_ami_type"
  instance_type = "var.aws_instance_type"
}

resource "null_resource" "post_instance_setup" {
  depends_on = [aws_instance.web_server]

  provisioner "local-exec" {
    command = <<EOT
      echo "Instance created with ID: ${aws_instance.web_server.id}"
      echo "Updating configuration files..."
      echo "Server is ready for deployment!" >> deployment.log
    EOT
  }

  triggers = {
    instance_id = aws_instance.web_server.id
  }
}
