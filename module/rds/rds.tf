resource "aws_db_instance" "gitlab_postgres" {
  allocated_storage       = 5                            # gigabytes
  backup_retention_period = 0                            # in days
  db_subnet_group_name    = "${var.db_subnet_group_id}"
  engine                  = "postgres"
  engine_version          = "9.6"
  identifier              = "gitlabdb"
  instance_class          = "db.t2.micro"
  multi_az                = false
  name                    = "${var.db_name}"
  port                    = 5432
  publicly_accessible     = true
  storage_encrypted       = false
  storage_type            = "gp2"
  username                = "${var.db_user}"
  password                = "${var.db_password}"
  vpc_security_group_ids  = ["${var.security_group_id}"]

  tags {
    Category = "gitlab"
    Name     = "postgres"
  }
}
