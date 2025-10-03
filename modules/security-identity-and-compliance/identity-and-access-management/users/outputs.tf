# # Output IAM user names
# output "iam_users" {
#   description = "List of IAM users created"
#   value       = [for u in aws_iam_user.users : u.name]
# }

# # Access Key IDs (safe to output)
# output "access_key_ids" {
#   description = "Access Key IDs for IAM users"
#   value       = { for k, v in aws_iam_access_key.user_keys : k => v.id }
# }

# # Secret Keys (sensitive!)
# output "secret_access_keys" {
#   description = "Secret Access Keys for IAM users"
#   value       = { for k, v in aws_iam_access_key.user_keys : k => v.secret }
#   sensitive   = true
# }

# =====================================================================================================#

output "iam_users" {
  value = [for u in aws_iam_user.users : u.name]
}

output "access_key_ids" {
  value = { for k, v in aws_iam_access_key.keys : k => v.id }
}

output "secret_access_keys" {
  value     = { for k, v in aws_iam_access_key.keys : k => v.secret }
  sensitive = true
}
