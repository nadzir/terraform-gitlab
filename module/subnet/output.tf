output "public_subnet_id_a" {
  value = "${aws_subnet.gitlab_public_a.id}"
}
output "public_subnet_id_b" {
  value = "${aws_subnet.gitlab_public_b.id}"
}

output "private_subnet_id_a" {
  value = "${aws_subnet.gitlab_private_subnet_a.id}"
}

output "private_subnet_id_b" {
  value = "${aws_subnet.gitlab_private_subnet_b.id}"
}

output "postgres_subnet_group_id" {
  value = "${aws_db_subnet_group.postgres_subnet_group.id}"
}

output "cache_subnet_group_id" {
  value = "${aws_db_subnet_group.cache_subnet_group.id}"
}