# Iterate over the list of usernames using for_each
resource "aws_iam_user" "users" {
  for_each = toset(var.usernames)  # Convert the list to a set to use with for_each
#Convert list to set using toset() function 
  
  name = each.key  # each.key refers to the current username in the list
  #Iterate over the list

  tags = {
    Name = each.key
  }
}