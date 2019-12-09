#!/bin/bash
WORK_PATH='/workplace/netease-cloud-music-api'
cd $WORK_PATH
echo "清理代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "开始构建镜像"
docker build -t netease-cloud-music-api:1.0 .
echo "删除旧容器"
docker stop netease-cloud-music-api-container
docker rm netease-cloud-music-api-container
echo "启动新容器"
docker container run -p 3000:3000 -d --name netease-cloud-music-api-container -d netease-cloud-music-api:1.0
