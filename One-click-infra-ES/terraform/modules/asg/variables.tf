variable "private_subnets" {
  description = "List of private subnet IDs for the ASG"
  type        = list(string)
}

variable "sg_id" {
  description = "Security group ID for EC2 in private subnets"
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
