provider "aws" {
  region = "ap-south-1" # Change to your AWS region
}

resource "aws_s3_bucket" "demo" {
  bucket = "my-first-terraform-bucket-ajay"
  acl    = "private"

  tags = {
    Name        = "MyFirstBucket"
    Environment = "Dev"
  }
}


