# This Terraform configuration defines a local variable `policy` using the `templatefile` function
# to render a policy template file (`policy.tpl`) with a variable `name` set to "sumit".
# 
# The `policy` local variable is then outputted using the `output` block.
# 
# A `null_resource` named `pretend_aws_iam_policy` is created with a `triggers` block that
# uses the `policy` local variable to determine when to re-create the resource.
# 
# The `local-exec` provisioner is used to execute a local command that echoes the value of the `policy` local variable.

locals {
  policy = templatefile("${path.module}/policy.tpl", {
    name = "sumit"
  })
}

output "policy" {
  value = "${local.policy}"
}

resource "null_resource" "pretend_aws_iam_policy" {
  triggers = {
    policy = "${local.policy}"
  }

  provisioner "local-exec" {
    command = "echo ${local.policy}"
  }
}