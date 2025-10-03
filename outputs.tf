

output "iam_users" {
  description = "List of IAM users created"
  value       = module.iam_users.iam_users
}

output "access_key_ids" {
  description = "Access Key IDs for IAM users"
  value       = module.iam_users.access_key_ids
}

output "secret_access_keys" {
  description = "Secret Access Keys for IAM users"
  value       = module.iam_users.secret_access_keys
  sensitive   = true
}