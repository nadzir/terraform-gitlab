resource "aws_route_table" "nat" {
  vpc_id = "${var.vpc_id}"

  tags {
    Category = "gitlab"
    Name     = "nat access routes"
  }
}

resource "aws_route" "nat" {
  route_table_id         = "${aws_route_table.nat.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway_id}"
}

resource "aws_route_table_association" "nat_a" {
  subnet_id      = "${var.private_subnet_id_a}"
  route_table_id = "${aws_route_table.nat.id}"
}
resource "aws_route_table_association" "nat_b" {
  subnet_id      = "${var.private_subnet_id_b}"
  route_table_id = "${aws_route_table.nat.id}"
}
