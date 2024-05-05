resource "aws_lb_target_group" "app-tg" {
  name        = "${var.Name}-tg"
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id
  health_check {
    interval            = var.health_check_intervals
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
}


resource "aws_lb" "app-lb" {
  name            = "${var.Name}-lb"
  internal        = var.aws_lb_internal
  security_groups = [aws_security_group.elb-sg.id]
  subnets         = var.subnets
}

resource "aws_lb_listener" "app-listner" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = var.listner_port
  protocol          = var.listner_protocol
  default_action {
    target_group_arn = aws_lb_target_group.app-tg.arn
    type             = var.listner_type
  }
}

resource "aws_alb_target_group_attachment" "ec2-attach" {
  count            = var.attached_instance_count
  target_group_arn = aws_lb_target_group.app-tg.arn
  target_id        = var.target_ids
}
