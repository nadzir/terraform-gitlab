variable vpc_id {}
variable availability_zone_a {}
variable availability_zone_b {}

variable "private_subnet_CIDR_block_a" {
  default = "10.0.2.0/24"
}

variable "private_subnet_CIDR_block_b" {
  default = "10.0.3.0/24"
}

variable "public_subnet_CIDR_block_a" {
  default = "10.0.1.0/24"
}

variable "public_subnet_CIDR_block_b" {
  default = "10.0.4.0/24"
}

variable "map_public_IP" {
  default = true
}
