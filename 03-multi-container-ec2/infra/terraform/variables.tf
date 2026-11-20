variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "my_ip" {
  description = "Your public IP with /32, e.g. 203.0.113.10/32"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier)"
  type        = string
  default     = "t3.micro"
}
