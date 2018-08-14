data "template_file" "userdata" {
  template = "${file("module/gitlab/userdata.sh")}"

  vars {
    NFS_IP = "${var.nfs_ip}"
    REDIS_HOST = "${var.redis_host}"
    DB_HOST = "${var.rds_endpoint}"
    DB_USER = "db_user"
    DB_PASS = "db_password"
    MOUNT_DIR = "gitlab-nfs"
    EXTERNAL_URL = "http://gitlab.is-this-halal.com"
  }
}
