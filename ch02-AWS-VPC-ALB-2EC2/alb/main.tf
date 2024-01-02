resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  enable_deletion_protection = var.enable_deletion_protection
}

// Additional ALB resources can be added here like listeners, target groups, etc.

