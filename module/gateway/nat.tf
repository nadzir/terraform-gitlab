resource "aws_nat_gateway" "nat_a" {
  allocation_id = "${aws_eip.nat_a.id}"
  subnet_id     = "${var.public_subnet_id_a}"

  tags {
    Category = "gitlab"
    Name     = "nat gateway a"
  }
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = "${aws_eip.nat_b.id}"
  subnet_id     = "${var.public_subnet_id_b}"

  tags {
    Category = "gitlab"
    Name     = "nat gateway b"
  }
}

resource "aws_eip" "nat_a" {
  vpc = true

  tags {
    Category = "gitlab"
    Name     = "elastic ip address for nat gateway a"
  }
}

resource "aws_eip" "nat_b" {
  vpc = true

  tags {
    Category = "gitlab"
    Name     = "elastic ip address for nat gateway b"
  }
}
