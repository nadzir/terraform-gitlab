resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${var.public_subnet_id}"

  tags {
    Category = "gitlab"
    Name     = "nat gateway"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  tags {
    Category = "gitlab"
    Name     = "elastic ip address for nat gateway"
  }
}
