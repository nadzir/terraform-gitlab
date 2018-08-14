variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}
