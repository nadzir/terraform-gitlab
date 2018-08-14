provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source         = "./module/vpc"
  vpc_cidr_block = "${var.vpc_cidr_block}"
}

module "subnet" {
  source                      = "./module/subnet"
  vpc_id                      = "${module.vpc.vpc_id}"
  availability_zone_a         = "${var.availability_zone_a}"
  availability_zone_b         = "${var.availability_zone_b}"
  public_subnet_CIDR_block_a  = "${var.public_subnet_CIDR_block_a}"
  public_subnet_CIDR_block_b  = "${var.public_subnet_CIDR_block_b}"
  private_subnet_CIDR_block_a = "${var.private_subnet_CIDR_block_a}"
  private_subnet_CIDR_block_b = "${var.private_subnet_CIDR_block_b}"
}

module "gateway" {
  source           = "./module/gateway"
  vpc_id           = "${module.vpc.vpc_id}"
  public_subnet_id = "${module.subnet.public_subnet_id_a}"
}

module "security" {
  source = "./module/security"
  vpc_id = "${module.vpc.vpc_id}"
}

module "routing" {
  source              = "./module/routing"
  vpc_id              = "${module.vpc.vpc_id}"
  public_subnet_id_a  = "${module.subnet.public_subnet_id_a}"
  public_subnet_id_b  = "${module.subnet.public_subnet_id_b}"
  private_subnet_id_a = "${module.subnet.private_subnet_id_a}"
  private_subnet_id_b = "${module.subnet.private_subnet_id_b}"
  internet_gateway_id = "${module.gateway.internet_gateway_id}"
  nat_gateway_id      = "${module.gateway.nat_gateway_id}"
}

module "bastion" {
  source              = "./module/bastion"
  vpc_id              = "${module.vpc.vpc_id}"
  public_subnet_id    = "${module.subnet.public_subnet_id_a}"
  security_group_id   = "${module.security.ssh_security_group_id}"
  availability_zone   = "${var.availability_zone_a}"
  internet_gateway_id = "${module.gateway.internet_gateway_id}"
  ami                 = "${var.ami}"
  key_name            = "${var.key_name}"
}

module "rds" {
  source             = "./module/rds"
  vpc_id             = "${module.vpc.vpc_id}"
  db_subnet_group_id = "${module.subnet.postgres_subnet_group_id}"
  security_group_id  = "${module.security.postgres_security_group_id}"
  db_name            = "${var.db_name}"
  db_user            = "${var.db_user}"
  db_password        = "${var.db_password}"
}

module "cache" {
  source              = "./module/cache"
  vpc_id              = "${module.vpc.vpc_id}"
  security_group_id   = "${module.security.cache_security_group_id}"
  private_subnet_id_a = "${module.subnet.private_subnet_id_a}"
  private_subnet_id_b = "${module.subnet.private_subnet_id_b}"
}

module "nfs" {
  source             = "./module/nfs"
  vpc_id             = "${module.vpc.vpc_id}"
  ami                = "${var.ami}"
  security_group_ids = ["${module.security.vpc_security_group_id}", "${module.security.mount_security_group_id}"]
  availability_zone  = "${var.availability_zone_a}"
  bastion_host       = "${module.bastion.bastion_host}"
  key_name           = "${var.key_name}"
  subnet_id          = "${module.subnet.private_subnet_id_a}"
}

module "gitlab" {
  source              = "./module/gitlab"
  security_group_ids  = ["${module.security.vpc_security_group_id}", "${module.security.mount_security_group_id}"]
  nfs_ip              = "${module.nfs.nfs_ip}"
  rds_endpoint        = "${module.rds.rds_endpoint}"
  redis_host          = "${module.cache.redis_host}"
  public_subnet_id_a  = "${module.subnet.public_subnet_id_a}"
  public_subnet_id_b  = "${module.subnet.public_subnet_id_b}"
  private_subnet_id_a = "${module.subnet.private_subnet_id_a}"
  private_subnet_id_b = "${module.subnet.private_subnet_id_b}"
  availability_zone_a = "${var.availability_zone_a}"
  availability_zone_b = "${var.availability_zone_b}"
}
