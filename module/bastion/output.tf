output "bastion_host" {
  value = "${aws_instance.gitlab_bastion.public_ip}"
}