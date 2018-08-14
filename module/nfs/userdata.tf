data "template_file" "userdata" {
  template = "${file("module/nfs/userdata.sh")}"
}
