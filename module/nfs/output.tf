output "nfs_ip" {
  value = "${aws_instance.gitlab_nfs.private_ip}"
}