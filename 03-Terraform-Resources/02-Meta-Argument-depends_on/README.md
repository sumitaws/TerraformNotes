### Explanation
aws_s3_bucket.example:
Creates the S3 bucket, which the EC2 instance will later depend on.

aws_iam_role.example:
Defines an IAM role for EC2.

aws_iam_role_policy.example:
Attaches a policy allowing access to the S3 bucket.

aws_instance.example:
The depends_on meta-argument explicitly declares dependencies on both:
The S3 bucket (aws_s3_bucket.example).
The IAM role policy (aws_iam_role_policy.example).
Terraform ensures these resources are fully created before provisioning the EC2 instance.

### When to Use depends_on
When dependencies are not automatically inferred (e.g., there is no direct reference in the resource configuration).
To ensure resources are created in a strict order, especially when dependent resources might otherwise be created concurrently.
