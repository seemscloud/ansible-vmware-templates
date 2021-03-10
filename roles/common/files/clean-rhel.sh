#!/bin/bash

systemctl stop sshd || service sshd stop
systemctl disable sshd || chkconfig sshd off

yum clean all

find /tmp -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /var/log -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /var/cache/yum -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /var/cache/dnf -maxdepth 1 -mindepth 1 -exec rm -rf {} \;
find /var/tmp -maxdepth 1 -mindepth 1 -exec rm -rf {} \;

rm -rfv /etc/ssh/ssh_host_*

yum repolist all
yum update -y

package-cleanup --oldkernels --count=1
dnf remove `dnf repoquery --installonly --latest-limit=-1 -q`

grub2-mkconfig -o /boot/grub2/grub.cfg

history -w
history -c