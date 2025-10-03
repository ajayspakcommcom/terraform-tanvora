terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # Stay aligned with stable provider major version
    }
  }

  # Remote backend for state management (MNC standard)
  # backend "s3" {
  #   bucket         = "tanvora-terraform-states" # Change to your org bucket
  #   key            = "${var.environment}/terraform.tfstate"    # Path inside bucket (env-specific)
  #   region         = "ap-south-1"
  #   dynamodb_table = "tanvora-terraform-locks"  # DynamoDB for state locking
  #   encrypt        = true
  # }
}

provider "aws" {
  region                   = var.region
  profile                  = var.aws_profile
  # shared_credentials_files = ["~/.aws/credentials"]
  default_tags {
    tags = {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "CloudOps"
    }
  }
}
