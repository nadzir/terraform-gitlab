data "template_file" "userdata" {
  template = "${file("module/gitlab/userdata.sh")}"

  vars {
    NFS_IP              = "${var.nfs_ip}"
    REDIS_HOST          = "${var.redis_host}"
    DB_HOST             = "${var.rds_endpoint}"
    DB_NAME             = "${var.db_name}"
    DB_USER             = "${var.db_user}"
    DB_PASS             = "${var.db_password}"
    MOUNT_DIR           = "gitlab-nfs"
    EXTERNAL_URL        = "${var.gitlab_url}"
    GITLAB_DOCKER_IMAGE = "${var.gitlab_docker_image}"
  }
}
