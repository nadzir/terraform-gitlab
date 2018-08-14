variable "security_group_ids" {
  type = "list"
}
variable "availability_zone_a" {}
variable "availability_zone_b" {}
variable "nfs_ip" {}
variable "public_subnet_id_a" {}
variable "public_subnet_id_b" {}
variable "private_subnet_id_a" {}
variable "private_subnet_id_b" {}

variable "instance_size" {
  default = "t2.medium"
}
variable "key_name" {}
variable "ami" {}
variable "rds_endpoint" {}
variable "redis_host" {}
variable "gitlab_url" {}
variable "gitlab_docker_image" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
