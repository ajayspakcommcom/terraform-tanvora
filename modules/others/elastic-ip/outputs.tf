output "elastic_ip" {
  description = "Elastic IP address"
  value       = aws_eip.this.public_ip
}

output "elastic_ip_id" {
  description = "Elastic IP resource ID"
  value       = aws_eip.this.id
}
