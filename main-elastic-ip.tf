
# -------------------------------------------------------------------
# Elastic IP Module
# This module provisions an Elastic IP in AWS and applies tags.
# The Elastic IP can later be associated with an EC2 instance or other resources.
# -------------------------------------------------------------------
module "elastic_ip" {
  source   = "./modules/others/elastic-ip"
  eip_name = "my-elastic-ip"
  tags = {
    Environment = "Dev"
    Project     = "Demo"
  }
}


