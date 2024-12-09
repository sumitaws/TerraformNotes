# This Terraform configuration creates multiple AWS IAM users by iterating over a set of usernames.
# The set is converted to a list to allow iteration using the count.index.
# 
# - count = length(var.usernames_set): Determines the number of IAM users to create based on the number of elements in the set.
# - tolist(var.usernames_set): Converts the set of usernames to a list to enable indexed access.
# - tolist(var.usernames_set)[count.index]: Accesses each username in the list using the current index provided by count.index.
#
# Each IAM user is assigned a name and a tag with the username.
# Convert the set to a list for count iteration
resource "aws_iam_user" "users" {
  count = length(var.usernames_set)

  # Convert set to list to use count.index
  name = tolist(var.usernames_set)[count.index]
  
  tags = {
    Name = tolist(var.usernames_set)[count.index]
  }
}

//tolist(var.usernames_set): Converts the set to a list to allow iteration using count.index
//count = length(var.usernames_set): Uses the length of the set (converted to a list) to iterate and create multiple IAM users.
//tolist(var.usernames_set)[count.index]: Accesses each element of the set (now a list) using the index provided by count.index