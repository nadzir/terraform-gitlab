#!/bin/bash

echo "Update"
sudo apt-get update -y
sleep 10

echo "Download docker"
sudo apt-get install -y docker-ce

echo "Mounting NFS"
sudo apt-get install -y nfs-common
sleep 10
sudo mkdir -p /${MOUNT_DIR}/
sudo chmod 777 /${MOUNT_DIR}/
# sudo mount ${NFS_IP}:/${MOUNT_DIR}/ /${MOUNT_DIR}/ -t nfs
echo "${NFS_IP}:/gitlab-nfs /gitlab-nfs nfs4 defaults,soft,rsize=1048576,wsize=1048576,noatime,nobootwait,lookupcache=positive 0 2" >> /etc/fstab
sudo mount -a -t nfs
sleep 10

echo "Installing docker"
sudo docker run --detach \
    --env GITLAB_OMNIBUS_CONFIG="
        postgresql['enable'] = false
        gitlab_rails['db_username'] = '${DB_USER}'
        gitlab_rails['db_password'] = '${DB_PASS}'
        gitlab_rails['db_host'] = '${DB_HOST}'
        gitlab_rails['db_port'] = '5432'
        gitlab_rails['db_database'] = '${DB_NAME}'
        gitlab_rails['db_adapter'] = 'postgresql'
        gitlab_rails['db_encoding'] = 'utf8'
        external_url '${EXTERNAL_URL}';
        gitlab_rails['lfs_enabled'] = true;

        redis['enable'] = false
        gitlab_rails['redis_host'] = '${REDIS_HOST}'
        gitlab_rails['redis_port'] = 6379

        gitlab_rails['gitlab_shell_ssh_port'] = 222
      " \
    --publish 443:443 --publish 80:80 --publish 222:22 \
    --name gitlab \
    --restart always \
    --volume /${MOUNT_DIR}/gitlab/config:/etc/gitlab \
    --volume /${MOUNT_DIR}/gitlab/logs:/var/log/gitlab \
    --volume /${MOUNT_DIR}/gitlab/data:/var/opt/gitlab \
    ${GITLAB_DOCKER_IMAGE}