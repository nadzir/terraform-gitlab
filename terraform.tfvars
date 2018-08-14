### Config file

## AWS Configuration
# Region for the vpc
region              = "ap-southeast-1"
# Availability zones to achive high availability
availability_zone_a = "ap-southeast-1a"
availability_zone_b = "ap-southeast-1b"
# Ami to host gitlab instances
ami                 = "ami-93733def"
# Key name for terraform to provision ec2 instances
key_name            = "key_name"

## Networking
vpc_cidr_block              = "10.0.0.0/16"
public_subnet_CIDR_block_a  = "10.0.1.0/24"
public_subnet_CIDR_block_b  = "10.0.1.0/24"
private_subnet_CIDR_block_a = "10.0.1.0/24"
private_subnet_CIDR_block_b = "10.0.1.0/24"

## Gitlab Configuration
# URL
gitlab_url          = "http://gitlab.domain.com/"
gitlab_docker_image = "gitlab/gitlab-ce:11.1.4-ce.0"
# DB
db_name             = "gitlab_db"
db_user             = "gitlab_user"
db_password         = "gitlab_password"

