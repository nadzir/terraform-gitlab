output "internet_gateway_id" {
  value = "${aws_internet_gateway.gitlab.id}"
}
output "nat_gateway_id_a" {
  value = "${aws_nat_gateway.nat_a.id}"
}

output "nat_gateway_id_b" {
  value = "${aws_nat_gateway.nat_b.id}"
}