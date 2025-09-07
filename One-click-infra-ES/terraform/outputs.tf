##############################
# Root Outputs
##############################

# ----------------------------
# ALB + Endpoints
# ----------------------------

# ALB DNS - Base DNS name of the Application Load Balancer
output "alb_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns
}

# Friendly Kibana URL
output "kibana_url" {
  description = "Kibana dashboard URL"
  value       = "http://${module.alb.alb_dns}"
}

# Friendly Elasticsearch URL
output "elasticsearch_url" {
  description = "Elasticsearch endpoint URL"
  value       = "http://${module.alb.alb_dns}/elasticsearch"
}

# ----------------------------
# Target Groups (infra only, optional)
# ----------------------------

output "es_target_group_arn" {
  description = "ARN of the Elasticsearch Target Group"
  value       = module.alb.es_target_group_arn
}

output "kibana_target_group_arn" {
  description = "ARN of the Kibana Target Group"
  value       = module.alb.kibana_target_group_arn
}

# ----------------------------
# Auto Scaling Group
# ----------------------------

output "asg_name" {
  description = "Name of the Auto Scaling Group (used by Ansible dynamic inventory)"
  value       = module.asg.asg_name
}

# ----------------------------
# Bastion Host
# ----------------------------

output "bastion_public_ip" {
  description = "Public IP address of the Bastion host (used by Jenkins to copy SSH key)"
  value       = module.bastion.public_ip
}
