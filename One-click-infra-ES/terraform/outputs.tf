##############################
# Root Outputs
##############################

# ALB DNS - Use this to access Kibana/Elasticsearch
output "alb_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns
}

# Elasticsearch Target Group ARN (optional if needed elsewhere)
output "es_target_group_arn" {
  description = "ARN of the Elasticsearch Target Group"
  value       = module.alb.es_target_group_arn
}

# Kibana Target Group ARN (optional if needed elsewhere)
output "kibana_target_group_arn" {
  description = "ARN of the Kibana Target Group"
  value       = module.alb.kibana_target_group_arn
}

# Auto Scaling Group Name - used by Ansible dynamic inventory (with tags)
output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.asg.asg_name
}

# Bastion Public IP - used by Jenkins to copy SSH key
output "bastion_public_ip" {
  description = "Public IP address of the Bastion host"
  value       = module.bastion.public_ip
}
