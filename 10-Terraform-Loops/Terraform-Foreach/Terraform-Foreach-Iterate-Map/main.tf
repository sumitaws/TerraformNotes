# Iterate over the map of usernames using for_each
resource "aws_iam_user" "users" {
  for_each = var.user_info  # for_each works directly on maps

  name = each.key  # each.key refers to the username (key in the map)
  
  tags = {
    Name = each.key        # Tag with the username
    Team = each.value      # Tag with the team name (value in the map)
  }
}

# Optionally, attach IAM policies for each user
resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each   = aws_iam_user.users
  user       = each.value.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess" # Example policy
}