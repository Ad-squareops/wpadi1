# Auto Scaling Group
module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  name = "asg-adi"

  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  target_group_arns         = module.alb.target_group_arns
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  security_groups           = [aws_security_group.SG.id]
  vpc_zone_identifier       = [element(module.vpc.private_subnets, 0), element(module.vpc.private_subnets, 1)]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay       = 600
      checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 60
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  # Launch template
  launch_template_name        = "adi-LT-test"
  launch_template_description = "Launch template example"
  update_default_version      = true
  security_groups             = [aws_security_group.SG.id]
  image_id                    = "ami-0ec52ef324bd47f0b"
  instance_type               = "t3a.small"
  user_data                   = base64encode("cwagent.json")
  key_name                    = "adikp1"
  ebs_optimized               = true
  enable_monitoring           = true

  # IAM role & instance profile
  iam_instance_profile_name = "adi-ec2-role"

  tags = {
    Name = "asg-test-adi"
  }
}

# Scaling Policy
resource "aws_autoscaling_policy" "asg-policy" {
  count                     = 1
  name                      = "asg-cpu-policy"
  autoscaling_group_name    = module.asg.autoscaling_group_name
  estimated_instance_warmup = 60
  policy_type               = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}
###
