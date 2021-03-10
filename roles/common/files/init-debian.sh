#!/bin/bash

dpkg-reconfigure openssh-server

systemctl enable ssh || (mv /etc/init/ssh.conf.disabled /etc/init/ssh.conf && update-rc.d ssh defaults && update-rc.d ssh enable)
systemctl restart ssh || service ssh restart