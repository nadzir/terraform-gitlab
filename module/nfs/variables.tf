variable "vpc_id" {}
variable "ami" {}

variable "security_group_ids" {
  type = "list"
}
variable "availability_zone" {}
variable "subnet_id" {}
variable "key_name" {}
variable "bastion_host" {}