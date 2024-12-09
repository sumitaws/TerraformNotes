# This Terraform configuration does the following:
# 
# 1. Configures the AWS provider to use the "us-east-1" region.
# 
# 2. Defines a data source "template_file" to read and render a policy template file
#    located at "${path.module}/policy.tpl". The template is provided with a variable
#    "name" set to "sumit".
# 
# 3. Creates a null resource "pretend_aws_iam_policy" that uses a local-exec provisioner
#    to echo the rendered policy template.
# 
# 4. Outputs the rendered policy template using the output variable "policy_rendered".

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
