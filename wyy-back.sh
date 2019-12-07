#!/bin/bash
WORK_PATH='~/workplace/NeteaseCloudMusicApi'
cd $WORK_PATH
echo "清理代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "开始构建镜像"
docker build -t wyy-back .
echo "删除旧容器"
docker stop wyy-back-container
docker rm wyy-back-container
echo "启动新容器"
docker container run -p 3000:3000 -d --name wyy-back-container wyy-back