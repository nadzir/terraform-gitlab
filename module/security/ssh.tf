resource "aws_security_group" "ssh" {
  name        = "ssh_security_group"
  description = "ssh security group (terraform-managed)"
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Category = "gitlab"
    Name     = "ssh security group"
  }
}
