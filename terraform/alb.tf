# Creation of ALB
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "alb-terraform-adi"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [element(module.vpc.public_subnets, 0), element(module.vpc.public_subnets, 1)]
  security_groups = [aws_security_group.SG.id]

  target_groups = [
    {
      name_prefix      = "TGadTt"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
      }
    }
  ]

  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = "arn:aws:acm:us-east-2:421320058418:certificate/ae6924e3-39d6-4c96-88ed-9987e1409918"
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  tags = {
    Name = "terraform-tg-adi"
  }
}
