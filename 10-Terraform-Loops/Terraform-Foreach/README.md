#Terraform: Understanding for_each vs count
Terraform offers two primary ways to loop over resources or modules when creating infrastructure: for_each and count. Each serves different use cases and has its own advantages.

##Table of Contents
Introduction
Difference Between for_each and count
When to Use for_each
When to Use count
Examples
Example with for_each
Example with count
Conclusion
Introduction
Terraform allows us to manage infrastructure as code, and oftentimes, we need to create multiple instances of a resource, module, or configuration. To achieve this, Terraform provides two constructs:

for_each: Best used for iterating over maps, sets, and lists that need unique identifiers.
count: Best used for lists and creating a defined number of resources with numeric indices.


Examples
###Example with for_each
This example demonstrates how to use for_each to create multiple IAM users where usernames and their team names are stored in a map.

Variables (variables.tf):
hcl
Copy code
variable "user_info" {
  type = map(string)
  default = {
    "user1" = "TeamA"
    "user2" = "TeamB"
    "user3" = "TeamC"
  }
}
Main Configuration (main.tf):
hcl
Copy code
provider "aws" {
  region = "us-west-2"
}

# Iterate over the map of users using for_each
resource "aws_iam_user" "users" {
  for_each = var.user_info
  
  name = each.key
  tags = {
    Team = each.value
  }
}

# Optionally, attach a policy to each user
resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each   = aws_iam_user.users
  user       = each.value.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
Explanation:
for_each = var.user_info: Iterates over the map user_info where the keys are usernames and values are team names.
Each user is assigned a name (from each.key) and a team tag (from each.value).
Example with count
This example demonstrates how to use count to create multiple IAM users from a list.

Variables (variables.tf):
hcl
Copy code
variable "usernames" {
  type    = list(string)
  default = ["user1", "user2", "user3"]
}
Main Configuration (main.tf):
hcl
Copy code
provider "aws" {
  region = "us-west-2"
}

# Iterate over the list of usernames using count
resource "aws_iam_user" "users" {
  count = length(var.usernames)
  
  name = var.usernames[count.index]  # Use count.index to access the current user
}

# Optionally, attach a policy to each user
resource "aws_iam_user_policy_attachment" "user_policies" {
  count      = length(var.usernames)
  user       = aws_iam_user.users[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
Explanation:
count = length(var.usernames): Creates resources based on the number of usernames in the list.
Each user is assigned a name from the list using count.index to access the list index.
