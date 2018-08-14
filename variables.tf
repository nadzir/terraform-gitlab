variable "region" {
  description = "Region to host gitlab"
}
variable "availability_zone_a" {
  description = "First AZ to provision gitlab (For high availability)"
}
variable "availability_zone_b" {
  description = "Second AZ to provision gitlab (For high availability)"
}
variable "ami" {
  description = "Ami to host gitlab"
}
variable "key_name" {
  description = "Key name for terraform to access relevant AWS services"
}
variable "gitlab_url" {
  description = "Gitlab external url, format is (http://...)"
}
variable "db_name" {
  description = "Database name"
}
variable "db_user" {
  description = "Database user"
}
variable "db_password" {
  description = "Database password"
}
variable "vpc_cidr_block" {
  description = "CIDR block for main vpc, format is (0.0.0.0/0)"
}

variable "public_subnet_CIDR_block_a" {
  description = "CIDR block for public subnet A, format is (0.0.0.0/0)"
}
variable "public_subnet_CIDR_block_b" {
  description = "CIDR block for public subnet B, format is (0.0.0.0/0)"
}
variable "private_subnet_CIDR_block_a" {
  description = "CIDR block for public subnet A, format is (0.0.0.0/0)"
}
variable "private_subnet_CIDR_block_b" {
  description = "CIDR block for public subnet B, format is (0.0.0.0/0)"
}