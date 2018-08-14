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
variable "key_pair"  {
  default = "EC2Access"
}
variable "ami" {
  default = "ami-93733def"
}

variable "rds_endpoint" {}
variable "redis_host" {}
