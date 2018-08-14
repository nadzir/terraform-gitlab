resource "aws_db_subnet_group" "postgres_subnet_group" {
  name = "postgres_subnet_group"

  subnet_ids = [
    "${aws_subnet.gitlab_private_subnet_a.id}",
    "${aws_subnet.gitlab_private_subnet_b.id}",
  ]

  tags {
    Category = "gitLab"
    Name     = "postgres subnet group"
  }
}
