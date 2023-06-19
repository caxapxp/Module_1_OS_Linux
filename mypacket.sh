#!/bin/bash

if cat /etc/apt/sources.list | grep backports
then echo "YES"
else apt-add-repository 'deb http://ru.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse'
fi

sudo apt-get update

sudo apt -y install apache2
sudo systemctl start apache2

sudo apt-get -y install python3

sudo apt-get -y install ssh
sudo apt-get -y install openssh-server
sudo systemctl start sshd

sudo apt-get -y install  mysql-server
sudo apt-get -y install  mysql-client

sudo apt -y install docker
sudo apt -y install docker.io

sudo apt-get -y onstall wireshark

sudo  apt-get -y install git
git init

sudo apt -y install cron
sudo systemctl enable cron

do
	mkdir /tmp/archive
	touch /usr/bin/my-backup.sh && echo "#!/bin/bash \
	tar cpf /tmp/archive/full-backup /home /etc/ssh/sshd_config /var/log" > /usr/bin/my-backup.sh
done

nano crontab -e && echo "0 13 * * 3 bash my-backup.sh"
