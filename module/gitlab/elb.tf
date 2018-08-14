resource "aws_elb" "gitlab" {
  name            = "gitlabelb"
  security_groups = ["${var.security_group_ids}"]

  subnets = [
    "${var.public_subnet_id_a}",
    "${var.public_subnet_id_b}",
  ]

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 60
    target              = "HTTP:80/explore"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}
