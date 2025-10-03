variable "eip_name" {
  description = "Name tag for Elastic IP"
  type        = string
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {}
}
