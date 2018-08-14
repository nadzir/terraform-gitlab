variable "vpc_id" {}
variable "public_subnet_id" {}
variable "security_group_id" {}
variable "availability_zone" {}
variable "internet_gateway_id" {}
variable "ami" {}
variable "key_name" {}
variable "instance_type" {
  default = "t2.nano"
}
