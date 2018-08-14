### Config file

## AWS Configuration
# Region for the vpc
region = "ap-southeast-1"
# Availability zones to achive high availability
availability_zone_a = "ap-southeast-1a"
availability_zone_b = "ap-southeast-1b"
# Ami to host gitlab instances
ami = "ami-93733def"
# Key name for terraform to provision ec2 instances
key_name = "EC2Access"

## Gitlab Configuration
# URL
gitlab_url = "http://gitlab.is-this-halal.com/"
# DB name
db_name = "gitlabdb"
# DB user
db_user = "gitlab_user"
# DB password
db_password = "gitlab_password"

## Networking
vpc_cidr_block              = "10.0.0.0/16"
public_subnet_CIDR_block_a  = "10.0.1.0/24"
public_subnet_CIDR_block_b  = "10.0.4.0/24"
private_subnet_CIDR_block_a = "10.0.2.0/24"
private_subnet_CIDR_block_b = "10.0.3.0/24"
