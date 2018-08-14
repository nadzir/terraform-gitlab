resource "aws_route_table" "nat_a" {
  vpc_id = "${var.vpc_id}"

  tags {
    Category = "gitlab"
    Name     = "nat A access routes"
  }
}

resource "aws_route_table" "nat_b" {
  vpc_id = "${var.vpc_id}"

  tags {
    Category = "gitlab"
    Name     = "nat B access routes"
  }
}

resource "aws_route" "nat_a" {
  route_table_id         = "${aws_route_table.nat_a.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway_id_a}"
}

resource "aws_route" "nat_b" {
  route_table_id         = "${aws_route_table.nat_b.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway_id_b}"
}

resource "aws_route_table_association" "nat_a" {
  subnet_id      = "${var.private_subnet_id_a}"
  route_table_id = "${aws_route_table.nat_a.id}"
}

resource "aws_route_table_association" "nat_b" {
  subnet_id      = "${var.private_subnet_id_b}"
  route_table_id = "${aws_route_table.nat_b.id}"
}
