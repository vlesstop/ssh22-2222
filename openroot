#!/bin/bash

# 设置root密码
echo "root:asd456qw4qd3(*^&*&%**" | chpasswd

# 启用通过SSH的root登录
sed -i 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config

# 重启SSH服务以应用更改
systemctl restart sshd
