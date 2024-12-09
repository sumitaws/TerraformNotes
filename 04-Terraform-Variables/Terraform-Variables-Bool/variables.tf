
# Variable Definitions
# --------------------

# aws_region: Specifies the AWS region to use.
# Type: string
# Default: "us-east-1"
# Description: AWS region

# aws_instance_type: Specifies the EC2 instance type.
# Type: string
# Default: "t3.micro"
# Description: Description about EC2 instance type

# aws_ami_type: Specifies the AMI ID to use for the EC2 instance.
# Type: string
# Default: "ami-0fff1b9a61dec8a5f"
# Description: Description about AMI ID

# instance_count: Specifies the number of EC2 instances to create.
# Type: number
# Default: 2
# Description: EC2 instance count

# enable_public_ip: Specifies whether to enable a public IP for the EC2 instance.
# Type: bool
# Default: true
# Description: Enabling public IP for EC2
variable "aws_region"{
type          = string
default       = "us-east-1"
description   = "aws region" 

}
//Variable type string
variable "aws_instance_type" {
  type        = string //--> Variable type string
  default     = "t3.micro"
  description = "Description about ec2 instance type"

}

variable "aws_ami_type" {
  type        = string
  default     = "ami-0fff1b9a61dec8a5f"
  description = "Description about AMI ID"
}

variable "instance_count" {
    description = "Ec2 instance count"
    type = number /// --> Variable type count
    default = 2
  
}
variable "enable_public_ip" {
  description = "Enableing public ip for ec2"
  type = bool
  default = true
  
}