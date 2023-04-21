#! /bin/bash

date "+%Y年%m月%d日 周%w %H:%M:%S"
echo '开始安装 Docker'
apt-get update
echo y | apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
echo y | apt-get install docker-ce docker-ce-cli containerd.io
docker run hello-world
echo 'Docker 安装完成，请检查是否出现 Hello from Docker!'
echo sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
echo sudo chmod +x /usr/local/bin/docker-compose \
echo docker-compose --version 
echo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

