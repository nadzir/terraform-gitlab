resource "aws_vpc" "gitlab" {
  cidr_block           = "${var.vpc_cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_support   = "${var.dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags {
    Category = "gitlab"
    Name = "vpc_sg"
  }
}