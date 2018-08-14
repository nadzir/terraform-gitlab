resource "aws_security_group" "mount" {
  vpc_id      = "${var.vpc_id}"
  name        = "mount_security_group"
  description = "mount security group (terraform-managed)"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 111
    to_port     = 111
    protocol    = "udp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 2049
    to_port     = 2049
    protocol    = "udp"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 111
    to_port     = 111
    protocol    = "udp"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 2049
    to_port     = 2049
    protocol    = "udp"
  }

  tags = {
    Category = "gitlab"
    Name     = "mount security group"
  }
}
