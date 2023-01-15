# defining the application load balancerr to be used
resource "aws_lb" "web_app_lb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_group     = var.security_group
  subnets            = var.subnet

  tags  = {
        "terraform": "true",
        "purpose": "web_app"
    }
}

# define the target group as well as what port the target group are listening on
resource "aws_lb_target_group" "web_app_lb_tg" {
  name     = var.tg_name
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags  = {
        "terraform": "true",
        "purpose": "web_app"
    }
}

# define listener rule to determine if a request is to be forwarded
resource "aws_lb_listener" "web_app_lb_listener" {
  load_balancer_arn = aws_lb.web_app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_app_lb_tg.arn
  }

  tags  = {
        "terraform": "true",
        "purpose": "web_app"
    }
}