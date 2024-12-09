## Terraform Variables - Boolean Example
This repository contains an example of how to use boolean variables in Terraform. Boolean variables are used to represent true or false values and can be very useful for toggling features or configurations in your Terraform scripts.

### Prerequisites
Terraform installed on your local machine.
AWS account with appropriate permissions to create resources.
### Variables
enable_public_ip
This boolean variable is used to enable or disable the assignment of a public IP address to an EC2 instance.

Type: bool
Default: true
Description: Enabling public IP for EC2 instance.

```t
variable "enable_public_ip" {
  description = "Enabling public IP for EC2 instance"
  type        = bool
  default     = true
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  network_interface {
    device_index          = 0
    associate_public_ip_address = var.enable_public_ip
  }

  tags = {
    Name = "ExampleInstance"
  }
}
```
In this example, the enable_public_ip variable is used to determine whether the EC2 instance should have a public IP address. By default, this variable is set to true, meaning the instance will have a public IP. You can override this value by specifying a different value when running Terraform commands.

Overriding Default Values
You can override the default value of the enable_public_ip variable by providing a different value in a terraform.tfvars file or by using the -var command-line option.

Using terraform.tfvars file
Create a terraform.tfvars file in the same directory as your Terraform configuration and add the following content:
```t
enable_public_ip = false
```

### Conclusion
This example demonstrates how to use boolean variables in Terraform to control the configuration of your resources. Boolean variables are a simple yet powerful way to make your Terraform scripts more flexible and reusable.