resource "aws_security_group" "cache" {
  vpc_id      = "${var.vpc_id}"
  description = "cache security group (terraform-managed)"
  name        = "cache_security_group"

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Category = "gitlab"
    Name     = "cache security group"
  }
}
