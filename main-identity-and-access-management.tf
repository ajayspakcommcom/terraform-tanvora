
# ------------------------------
# IAM Users
# # ------------------------------
module "iam_users" {
  source     = "./modules/security-identity-and-compliance/identity-and-access-management/users"
  user_names = ["manish", "ajay", "ravi"]

  tags = {
    Team  = "DevOps"
    Owner = "CloudOps"
  }
}

# ------------------------------
# IAM Group (Developers)
# ------------------------------
module "iam_group" {
  source      = "./modules/security-identity-and-compliance/identity-and-access-management/groups"
  group_name  = "Developers"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  ]
}

# ------------------------------
# IAM Role for EC2
# ------------------------------
module "ec2_role" {
  source     = "./modules/security-identity-and-compliance/identity-and-access-management/roles"
  role_name  = "ec2-app-role"
  service    = "ec2.amazonaws.com"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
}

# ------------------------------
# IAM Custom Policy (Example: Only List S3 Buckets)
# ------------------------------
module "custom_policy" {
  source      = "./modules/security-identity-and-compliance/identity-and-access-management/policies"
  policy_name = "ListS3BucketsOnly"
  description = "Custom policy to only list S3 buckets"
  policy_file = "${path.module}/policies/list-s3.json"
}

# notes 
# What’s Typically Added Later (if needed)
  # IAM Roles → for services (EC2, Lambda, ECS, App Runner)
  # Custom Policies (JSON) → least-privilege, compliance rules
  # MFA Enforcement → Security baseline
  # IAM Identity Center (SSO) → for enterprise user management (replaces IAM users for humans in many MNCs)
  # AWS Organizations + SCPs → Account-level guardrails


