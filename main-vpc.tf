module "vpc" {
  source          = "./modules/network-content-delivery/vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["ap-south-1a", "ap-south-1b"]

  project     = var.project
  environment = var.environment

  tags = {
    Owner = "CloudOps"
    Team  = "DevOps"
  }
}

# notes
# What’s Typically Added Later (if needed)
# What remains (MNC best practices):
# 🔹 VPC Endpoints (S3, DynamoDB, ECR, Secrets Manager)
# 🔹 Security Groups (for EC2, ALB, DB)
# 🔹 Network ACLs (optional, extra compliance)
# 🔹 Flow Logs → CloudWatch/S3
# 🔹 Bastion Host / VPN / Direct Connect (secure access)
# 🔹 VPC Peering / Transit Gateway (multi-VPC setups)
# 🔹 IPv6 support (dual-stack networks)
# 🔹 Strict tagging policy