variable "user_names" {
  description = "List of IAM user names to create"
  type        = list(string)
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to IAM users"
  type        = map(string)
  default     = {}
}

