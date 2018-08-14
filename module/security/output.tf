output "ssh_security_group_id" {
  value = "${aws_security_group.ssh.id}"
}
output "postgres_security_group_id" {
  value = "${aws_security_group.postgres.id}"
}
output "vpc_security_group_id" {
  value = "${aws_security_group.vpc.id}"
}
output "mount_security_group_id" {
  value = "${aws_security_group.mount.id}"
}
output "cache_security_group_id" {
  value = "${aws_security_group.cache.id}"
}