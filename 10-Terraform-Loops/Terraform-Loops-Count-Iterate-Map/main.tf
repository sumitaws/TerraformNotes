# This resource block creates AWS IAM users based on a map variable `user_info_map`.
# The `count` meta-argument is used to create a user for each key in the map.
# The `name` attribute assigns the username from the map keys.
# The `tags` block assigns tags to each user, including the username and a team name from the map values.
# The `length` function is used to determine the number of users to create based on the map keys.
# The `keys` and `values` functions are used to access the keys and values of the map.
# The `count.index` is used to access the current index in the loop.
# The `count` meta-argument is used to iterate over the map keys and create a user for each key.


resource "aws_iam_user" "users" {
  count = length(keys(var.user_info_map)) # Count based on the number of keys in the map

  name = keys(var.user_info_map)[count.index] # Access the username (key)

  tags = {
    Name  = keys(var.user_info_map)[count.index] # Username as a tag
    Team  = values(var.user_info_map)[count.index] # Tag from the value in the map
  }
}

