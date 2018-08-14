resource "aws_volume_attachment" "gitlab_vol_attachment" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.gitlab_data.id}"
  instance_id = "${aws_instance.gitlab_nfs.id}"
}

resource "aws_ebs_volume" "gitlab_data" {
  availability_zone = "${var.availability_zone}"
  size              = 10

  tags {
    Category = "gitlab"
    Name     = "ebs"
  }
}
