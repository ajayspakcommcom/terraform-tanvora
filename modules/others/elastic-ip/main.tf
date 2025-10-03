resource "aws_eip" "this" {
  domain = "vpc"   # Required if you are using VPC

  tags = merge(
    var.tags,
    {
      Name = var.eip_name
    }
  )
}
