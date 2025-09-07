variable "private_subnets" {
  description = "List of private subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for EC2 instances in private subnets"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for SSH access to EC2 instances"
  type        = string
}

variable "es_target_group_arn" {
  description = "ARN of the Elasticsearch target group"
  type        = string
}

variable "kibana_target_group_arn" {
  description = "ARN of the Kibana target group"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the launch template"
  type        = string
}
