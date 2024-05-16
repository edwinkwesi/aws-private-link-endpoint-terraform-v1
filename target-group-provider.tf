resource "aws_lb_target_group" "provider-target-group" {
  name     = "Provder-Target-Group"
  port     = "80"
  protocol = "TCP"
  vpc_id   = aws_vpc.service-provider.id
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
  }
}


#  Target group attachment
resource "aws_lb_target_group_attachment" "provider_tg_attachment" {
 target_group_arn = aws_lb_target_group.provider-target-group.arn
 target_id        = aws_instance.private-ec2.id
 port             = 80
}



resource "aws_alb_listener" "provider-alb-listener" {
  load_balancer_arn = aws_lb.provider_nlb.id
  port              = "80"
  protocol          = "TCP"
  depends_on        = [aws_lb_target_group.provider-target-group]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.provider-target-group.arn
  }
}
