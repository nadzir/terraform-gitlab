resource "aws_internet_gateway" "gitlab" {
  vpc_id = "${var.vpc_id}"

  tags {
    Category = "gitlab"
    Name     = "internet gateway"
  }
}
