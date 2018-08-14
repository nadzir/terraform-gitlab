resource "aws_instance" "gitlab_bastion" {
  ami                    = "${var.ami}"
  key_name               = "${var.key_name}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  subnet_id              = "${var.public_subnet_id}"

  tags = {
    Category = "gitlab"
    Name     = "bastion"
  }
}
