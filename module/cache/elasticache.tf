resource "aws_elasticache_subnet_group" "private" {
  name = "gitlab"

  subnet_ids = [
    "${var.private_subnet_id_a}",
    "${var.private_subnet_id_b}",
  ]
}

resource "aws_elasticache_cluster" "gitlab" {
  cluster_id           = "gitlab"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis4.0"
  port                 = 6379
  subnet_group_name    = "${aws_elasticache_subnet_group.private.name}"
  security_group_ids   = ["${var.security_group_id}"]
}
