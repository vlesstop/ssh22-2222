#!/bin/bash

# 检查是否为root用户
if [ "$(id -u)" != "0" ]; then
   echo "这个脚本需要以root用户运行" 1>&2
   exit 1
fi

# 提示用户确认执行操作
read -p "本脚本会修改默认SSH端口22修改为2222，是否继续？(y/n): " confirmation

if [ "$confirmation" != "y" ] && [ "$confirmation" != "Y" ]; then
   echo "用户取消操作。未进行任何更改。"
   exit 1
fi

# 检测系统类型
if [ -f /etc/debian_version ]; then
    # Debian 或 Ubuntu 系统
    echo "检测到 Debian 或 Ubuntu 系统"
    
    # 修改SSH配置文件来更改端口（示例中使用2222端口）
    sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
    
    # 重启SSH服务
    systemctl restart ssh
    
    echo "SSH端口已更改为2222并且SSH服务已重启。"

elif [ -f /etc/redhat-release ]; then
    # CentOS 系统
    echo "检测到 CentOS 系统"
    
    # 修改SSH配置文件来更改端口（示例中使用2222端口）
    sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
    
    # 重启SSH服务
    systemctl restart sshd
    
    echo "SSH端口已更改为2222并且SSH服务已重启。"

else
    echo "未检测到受支持的系统类型（Debian、Ubuntu、CentOS）。脚本仅支持这些系统。"
    exit 1
fi
