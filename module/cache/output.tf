output "redis_host" {
  value = "${aws_elasticache_cluster.gitlab.cache_nodes.0.address}"
}