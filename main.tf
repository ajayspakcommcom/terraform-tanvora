
# -------------------------------------------------------------------
# Elastic IP Module
# This module provisions an Elastic IP in AWS and applies tags.
# The Elastic IP can later be associated with an EC2 instance or other resources.
# -------------------------------------------------------------------
# module "elastic_ip" {
#   source   = "./modules/others/elastic-ip"
#   eip_name = "my-elastic-ip"
#   tags = {
#     Environment = "Dev"
#     Project     = "Demo"
#   }
# }


# Each user will also get an Access Key + Secret Key (if enabled in module).
# Tags are applied for ownership and team tracking.
# -------------------------------------------------------------------
# module "iam_users" {
#   source     = "./modules/security-identity-and-compliance/identity-and-access-management"

#   user_names = ["manish", "ajay", "ravi"]

#   policy_arns = [
#     "arn:aws:iam::aws:policy/AmazonS3FullAccess",
#     "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
#     "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
#   ]

#   tags = {
#     Owner = "CloudOps"
#     Team  = "DevOps"
#   }
# }




