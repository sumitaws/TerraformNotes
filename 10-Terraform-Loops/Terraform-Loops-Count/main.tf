# This Terraform configuration creates multiple IAM users in AWS.
# The number of users created is determined by the length of the 'usernames' variable.
# Each user is assigned a name from the 'usernames' variable based on the current index.
# Additionally, a tag with the key 'Name' and the value of the username is added to each user.
# Optionally, you can attach IAM policies or other resources to each user using a separate resource block.
resource "aws_iam_user" "users" {
  # The 'count' parameter is set to the length of the 'usernames' variable.
  # This determines the number of instances to create based on the number of elements in the 'usernames' list.
  count = length(var.usernames)

  name = var.usernames[count.index]
  
  tags = {
    # Assigns a value from the 'usernames' variable to the 'Name' attribute
    # using the current index from the 'count' meta-argument.
    Name = var.usernames[count.index]
  }
}

# Optionally, attach IAM policies or other resources for each user

# resource "aws_iam_user_policy_attachment" "user_policies" {
#   count      = length(var.usernames)
#   user       = aws_iam_user.users[count.index].name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess" # Example policy
# }
