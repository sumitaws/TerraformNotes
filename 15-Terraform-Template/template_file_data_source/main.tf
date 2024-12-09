# This Terraform configuration uses the AWS provider and is set to the "us-east-1" region.
#
# Data Source:
# - `template_file` "policy": Reads a policy template file located at `${path.module}/policy.tpl` and substitutes the variable `name` with the value "sumit".
#
# Resource:
# - `null_resource` "pretend_aws_iam_policy": A placeholder resource that uses a local-exec provisioner to echo the rendered policy template.
#
# Output:
# - `policy_rendered`: Outputs the rendered policy template content.

provider "aws" {
  region = "us-east-1"
}

# Data source for the policy template
data "template_file" "policy" {
  template = file("${path.module}/policy.tpl")
  vars = {
    name = "sumit"
  }
}

# Example resource using the rendered policy
resource "null_resource" "pretend_aws_iam_policy" {
  provisioner "local-exec" {
    command = "echo '${data.template_file.policy.rendered}'"
  }
}

# Example output of the rendered policy
output "policy_rendered" {
  value = data.template_file.policy.rendered
}
