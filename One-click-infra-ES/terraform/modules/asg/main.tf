# -----------------------------------------
# Launch Template for EC2 in Private Subnets
# -----------------------------------------
resource "aws_launch_template" "lt" {
  name_prefix   = "private-ec2-"
  image_id      = "ami-07f07a6e1060cd2a8" # Ubuntu, 22.04, amd64 (ap-south-1)
  instance_type = "t3.medium"
  key_name      = var.key_name

  vpc_security_group_ids = [var.sg_id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              # Update apt and install prerequisites for ELK
              apt-get update -y && apt-get upgrade -y
              apt-get install -y openjdk-17-jdk python3 python3-pip
              pip3 install --upgrade pip boto3
              EOF
)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "asg-instance"
      monitoring = "true"
      Role       = "monitoring_true"  # Or whatever your group name is
  }
}

# -----------------------------------------
# Auto Scaling Group
# -----------------------------------------
resource "aws_autoscaling_group" "asg" {
  name                      = "private-asg"
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 5
  vpc_zone_identifier       = var.private_subnets
  health_check_type         = "EC2"
  health_check_grace_period = 120
  target_group_arns         = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  termination_policies = ["OldestInstance"]
}



