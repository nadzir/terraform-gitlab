resource "aws_subnet" "gitlab_private_subnet_a" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.private_subnet_CIDR_block_a}"
  availability_zone = "${var.availability_zone_a}"

  tags = {
    Category = "gitlab"
    Name     = "private subnet a"
  }
}

resource "aws_subnet" "gitlab_private_subnet_b" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.private_subnet_CIDR_block_b}"
  availability_zone = "${var.availability_zone_b}"

  tags = {
    Category = "gitlab"
    Name     = "private subnet b"
  }
}
