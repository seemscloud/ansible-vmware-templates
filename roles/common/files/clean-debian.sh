#!/bin/bash

systemctl stop ssh || service ssh stop
systemctl disable ssh || (update-rc.d ssh disable && update-rc.d -f ssh remove && mv /etc/init/ssh.conf /etc/init/ssh.conf.disabled)

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

apt-get autoremove --purge -y apparmor ufw
apt-get autoremove --purge
apt-get autoclean
apt-get clean

find /var/log -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /tmp -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /var/cache/apt/archives -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /var/tmp -maxdepth 1 -mindepth 1 -exec rm -rf {} \;

rm -rf /etc/ssh/ssh_host_*

dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p' | xargs echo -e "\e[93mOLD KERNEL INFO! \e[39m"

update-grub

history -w
history -c