resource "aws_lb" "alb" {
  name               = "app-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.public_subnets

  tags = {
    Name = "AppLoadBalancer"
  }
}

# ----------------------------
# Elasticsearch Target Group
# ----------------------------
resource "aws_lb_target_group" "es_tg" {
  name        = "es-target-group"
  port        = 9200
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "ElasticsearchTargetGroup"
  }
}

# ----------------------------
# Kibana Target Group
# ----------------------------
resource "aws_lb_target_group" "kibana_tg" {
  name        = "kibana-target-group"
  port        = 5601
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    port                = "5601"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "KibanaTargetGroup"
  }
}

# ----------------------------
# Listener (HTTP :80)
# ----------------------------
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    # Default = Kibana
    type             = "forward"
    target_group_arn = aws_lb_target_group.kibana_tg.arn
  }
}

# ----------------------------
# Listener Rules
# ----------------------------
# /elasticsearch → Elasticsearch TG
resource "aws_lb_listener_rule" "es_rule" {
  listener_arn = aws_lb_listener.listener.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.es_tg.arn
  }

  condition {
    path_pattern {
      values = ["/elasticsearch*"]
    }
  }
}

# /kibana → Kibana TG
resource "aws_lb_listener_rule" "kibana_rule" {
  listener_arn = aws_lb_listener.listener.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kibana_tg.arn
  }

  condition {
    path_pattern {
      values = ["/kibana*"]
    }
  }
}
