resource "aws_launch_configuration" "gitlab_host_launch" {
  image_id        = "${var.ami}"
  instance_type   = "${var.instance_size}"
  security_groups = ["${var.security_group_ids}"]
  key_name        = "${var.key_pair}"
  user_data       = "${data.template_file.userdata.rendered}"
}

resource "aws_autoscaling_group" "gitlab" {
  launch_configuration = "${aws_launch_configuration.gitlab_host_launch.id}"

  vpc_zone_identifier = [
    "${var.private_subnet_id_a}",
    "${var.private_subnet_id_b}",
  ]

  min_size          = 2
  max_size          = 2
  load_balancers    = ["${aws_elb.gitlab.name}"]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "gitlab"
    propagate_at_launch = true
  }
}
