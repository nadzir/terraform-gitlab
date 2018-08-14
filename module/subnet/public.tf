resource "aws_subnet" "gitlab_public_a" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnet_CIDR_block_a}"
  map_public_ip_on_launch = "${var.map_public_IP}"
  availability_zone       = "${var.availability_zone_a}"

  tags = {
    Category = "gitlab"
    Name     = "public subnet a"
  }
}

resource "aws_subnet" "gitlab_public_b" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnet_CIDR_block_b}"
  map_public_ip_on_launch = "${var.map_public_IP}"
  availability_zone       = "${var.availability_zone_b}"

  tags = {
    Category = "gitlab"
    Name     = "public subnet b"
  }
}
