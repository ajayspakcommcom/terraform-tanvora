# Create IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(var.user_names)
  name     = each.value
  tags     = var.tags
}

# Build user-policy pairs
locals {
  user_policy_pairs = flatten([
    for user in var.user_names : [
      for policy in var.policy_arns : {
        user   = user
        policy = policy
      }
    ]
  ])
}

# Attach policies
resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each = {
    for pair in local.user_policy_pairs : "${pair.user}-${basename(pair.policy)}" => pair
  }

  user       = aws_iam_user.users[each.value.user].name
  policy_arn = each.value.policy
}

# Create IAM Access Keys for each user
resource "aws_iam_access_key" "user_keys" {
  for_each = aws_iam_user.users
  user     = each.value.name
}
