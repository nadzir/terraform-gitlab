resource "aws_db_subnet_group" "cache_subnet_group" {
  name = "cache_subnet_group"

  subnet_ids = [
    "${aws_subnet.gitlab_private_subnet_a.id}",
    "${aws_subnet.gitlab_private_subnet_b.id}",
  ]

  tags {
    Category = "gitLab"
    Name     = "cache subnet group"
  }
}
