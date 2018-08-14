# resource "aws_instance" "gitlab_host" {
#   instance_type          = "${var.instance_size}"
#   ami                    = "${var.ami}"
#   key_name               = "${var.key_pair}"
#   vpc_security_group_ids = ["${var.security_group_ids}"]
#   subnet_id              = "${var.subnet_a_id}"
#   user_data              = "${data.template_file.userdata.rendered}"

#   # connection {
#   #   user        = "ubuntu"
#   #   private_key = "${file("secret/EC2Access.pem")}"
#   #   timeout     = "5m"
#   # }


#   # provisioner "file" {
#   #   source      = "provisioning/gitlab/docker-compose.yml"
#   #   destination = "/tmp/gitlab-docker-compose.yml"
#   # }


#   # provisioner "remote-exec" {
#   #   inline = [<<EOF
#   #     set -x
#   #     echo "Update"
#   #     sudo apt-get update
#   #     sleep 10


#   #     echo "Download docker-compose"
#   #     sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
#   #     sudo chmod +x /usr/local/bin/docker-compose
#   #     sleep 10


#   #     echo "Mounting NFS"
#   #     sudo apt-get install -y nfs-common
#   #     sleep 10
#   #     sudo mkdir -p /gitlab-nfs
#   #     sudo chmod 777 /gitlab-nfs
#   #     sudo mount ${var.nfs_ip}:/gitlab-nfs /gitlab-nfs
#   #     sleep 10


#   #     sudo mkdir -p /opt/gitlab


#   #     echo "Setting up environment variable"
#   #     sudo touch /opt/gitlab/.env
#   #     sudo chmod 777 /opt/gitlab/.env
#   #     echo DB_HOST=${var.rds_endpoint} >> /opt/gitlab/.env
#   #     echo DB_USER=db_user >> /opt/gitlab/.env
#   #     echo DB_PASS=db_password >> /opt/gitlab/.env
#   #     echo MOUNT_DIR=gitlab-nfs >> /opt/gitlab/.env
#   #     echo EXTERNAL_URL=http://${aws_instance.gitlab_host.public_ip} >> /opt/gitlab/.env


#   #     echo "Set up gitlab"
#   #     sudo mv /tmp/gitlab-docker-compose.yml /opt/gitlab/docker-compose.yml
#   #     cd /opt/gitlab
#   #     sudo docker-compose up -d
#   #   EOF
#   #   ]
#   # }

#   tags = {
#     Name = "gitlab"
#   }
# }
