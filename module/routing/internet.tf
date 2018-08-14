resource "aws_route_table" "internet" {
  vpc_id = "${var.vpc_id}"

  tags {
    Category = "gitlab"
    Name     = "internet access routes"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_route_table.internet.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.internet_gateway_id}"
}

resource "aws_route_table_association" "internet_a" {
  subnet_id      = "${var.public_subnet_id_a}"
  route_table_id = "${aws_route_table.internet.id}"
}
resource "aws_route_table_association" "internet_b" {
  subnet_id      = "${var.public_subnet_id_b}"
  route_table_id = "${aws_route_table.internet.id}"
}
