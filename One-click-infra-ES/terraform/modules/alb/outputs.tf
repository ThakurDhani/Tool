output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "es_target_group_arn" {
  value = aws_lb_target_group.es_tg.arn
}

output "kibana_target_group_arn" {
  value = aws_lb_target_group.kibana_tg.arn
}
