variable "private_subnets" {
  description = "List of private subnet IDs for the ASG"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for EC2 in private subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN for the ALB"
  type        = string
}
