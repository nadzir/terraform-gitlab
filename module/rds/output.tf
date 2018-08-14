output "rds_endpoint" {
  value = "${element(split(":",aws_db_instance.gitlab_postgres.endpoint),0)}"
}
