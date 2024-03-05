#!/bin/bash
#exit
#systemctl start mariadb
#systemctl enable mariadb

cat << EOL > /etc/yum.repos.d/mariadb.repo
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/rhel8-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
module_hotfixes=1
EOL

rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
dnf install MariaDB-server MariaDB-client --allowerasing
curl -sSL https://install.efa-project.org | bash

mv /home/mp/backup-*.tar.gz  /var/eFa/backup
/usr/sbin/eFa-Configure