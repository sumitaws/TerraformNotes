# This Terraform configuration creates an EC2 instance with the specified AMI and instance type.
# The `lifecycle` block is used to specify that changes to the `tags` attribute should be ignored.
# This can be useful if tags are managed by an external system or management agent.
# Create EC2 Instance
resource "aws_instance" "web" {
  ami = "ami-0915bcb5fa77e4892" # Amazon Linux
  instance_type = "t2.micro"
  tags = {
    "Name" = "web-3"
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  
}
}