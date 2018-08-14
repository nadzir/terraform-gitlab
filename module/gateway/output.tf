output "internet_gateway_id" {
  value = "${aws_internet_gateway.gitlab.id}"
}
output "nat_gateway_id" {
  value = "${aws_nat_gateway.nat.id}"
}