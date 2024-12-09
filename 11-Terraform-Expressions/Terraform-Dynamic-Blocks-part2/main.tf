
# This Terraform configuration defines a dynamic AWS Security Group with ingress and egress rules.
# 
# Local Values:
# - `ingress_rules`: A list of ingress rules with properties:
#   - `from_port`: The starting port for the rule.
#   - `to_port`: The ending port for the rule.
#   - `protocol`: The protocol for the rule (e.g., "tcp").
#   - `cidr_blocks`: A list of CIDR blocks for the rule.
# - `egress_rules`: A list of egress rules with properties:
#   - `from_port`: The starting port for the rule.
#   - `to_port`: The ending port for the rule.
#   - `protocol`: The protocol for the rule (e.g., "all").
#   - `cidr_blocks`: A list of CIDR blocks for the rule.
#
# Resources:
# - `aws_security_group.example`: An AWS Security Group resource with dynamic ingress and egress rules.
#   - `name`: The name of the security group.
#   - `description`: A description of the security group.
#   - `dynamic "ingress"`: A dynamic block to define multiple ingress rules.
#   - `dynamic "egress"`: A dynamic block to define multiple egress rules.
#   - `tags`: A map of tags to assign to the security group.
#
# Outputs:
# - `security_group_id`: The ID of the created AWS Security Group.
# Define local values
locals {
    ingress_rules = [
        {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["192.168.1.0/24"]
        }
    ]

    egress_rules = [
        {
            from_port   = 0
            to_port     = 0
            protocol    = "all"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}

# AWS Security Group
resource "aws_security_group" "example" {
    name        = "example-sg"
    description = "Security group for example"

    # Dynamic ingress block
    dynamic "ingress" {
        for_each = local.ingress_rules
        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }

    # Dynamic egress block
    dynamic "egress" {
        for_each = local.egress_rules
        content {
            from_port   = egress.value.from_port
            to_port     = egress.value.to_port
            protocol    = egress.value.protocol
            cidr_blocks = egress.value.cidr_blocks
        }
    }

    tags = {
        Name = "example-security-group"
    }
}

# Output security group ID
output "security_group_id" {
    value = aws_security_group.example.id
}
