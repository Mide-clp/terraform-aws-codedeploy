resource "aws_launch_template" "web_app_lt" {
  name = var._asg_launch_template_name
  image_id = var.asg_image_id
  instance_type = var.asg_instance_type
  user_data = ""

  tags    = {
        "terraform": "true",
        "purpose": "web_app"
    }
}

resource "aws_autoscaling_group" "web_app_asg" {
  name = var.asg_name  
  desired_capacity = var.asg_desired_capacity
  min_size = var.asg_min_size
  max_size = var.asg_max_size
  health_check_type = "EC2"
  health_check_grace_period = 600
  vpc_zone_identifier = var.asg_zone_identifier
  termination_policies = ["OldestInstance"]


  launch_template {
    id = aws_launch_template.web_app_lt.id
    version = "$Latest"
  }

  tags    = {
        "terraform": "true",
        "purpose": "web_app"
    }
}

resource "aws_autoscaling_lifecycle_hook" "web_app_asg_lifecyle_hook" {
   name = var.asg_lifecycle_hook_name
   autoscaling_group_name = aws_autoscaling_group.web_app_asg.name
   default_result = "CONTINUE"
   heartbeat_timeout = 2200
   lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
}

resource "aws_autoscaling_attachment" "web_app_as_a" {
  autoscaling_group_name = aws_autoscaling_group.web_app_asg.id
  elb = var.asg_elb
}