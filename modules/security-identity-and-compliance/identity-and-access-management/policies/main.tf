resource "aws_iam_policy" "custom" {
  name        = var.policy_name
  description = var.description
  policy      = file(var.policy_file) # JSON file with IAM policy
}
