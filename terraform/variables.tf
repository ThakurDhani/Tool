variable "key_name" {
  description = "Name of the EC2 Key Pair for SSH access"
  type        = string
  default     = "oneclick"
}

variable "instance_type" {
  description = "EC2 instance type for Auto Scaling Group"
  type        = string
  default     = "t3.medium"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  description = "Availability Zones for subnet distribution"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}