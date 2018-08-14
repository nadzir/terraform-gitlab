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
sudo mount ${NFS_IP}:/${MOUNT_DIR}/ /${MOUNT_DIR}/
sleep 10

echo "Installing docker"
sudo docker run --detach \
    --env GITLAB_OMNIBUS_CONFIG="
        postgresql['enable'] = false
        gitlab_rails['db_username'] = '${DB_USER}'
        gitlab_rails['db_password'] = '${DB_PASS}'
        gitlab_rails['db_host'] = '${DB_HOST}'
        gitlab_rails['db_port'] = '5432'
        gitlab_rails['db_database'] = 'gitlab_db'
        gitlab_rails['db_adapter'] = 'postgresql'
        gitlab_rails['db_encoding'] = 'utf8'
        external_url '${EXTERNAL_URL}';
        gitlab_rails['lfs_enabled'] = true;

        redis['enable'] = false
        gitlab_rails['redis_host'] = '${REDIS_HOST}'
        gitlab_rails['redis_port'] = 6379
      " \
    --publish 443:443 --publish 80:80 \
    --name gitlab \
    --restart always \
    --volume /${MOUNT_DIR}/gitlab/config:/etc/gitlab \
    --volume /${MOUNT_DIR}/gitlab/logs:/var/log/gitlab \
    --volume /${MOUNT_DIR}/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:11.1.4-ce.0