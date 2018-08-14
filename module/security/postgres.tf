resource "aws_security_group" "postgres" {
  name = "postgres_security_group"

  description = "RDS postgres servers (terraform-managed)"
  vpc_id      = "${var.vpc_id}"

  # Only postgres in
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Category = "gitlab"
    Name     = "cache security group"
  }
}
