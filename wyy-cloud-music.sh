#!/bin/bash
WORK_PATH='/workplace/wyy-cloud-music'
cd $WORK_PATH
echo "清理代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "打包最新代码"
npm run build
echo "开始构建镜像"
docker build -t wyy-cloud-music:1.0
echo "删除旧容器"
docker stop wyy-cloud-music-container
docker rm wyy-cloud-music-container
echo "启动新容器"
docker container run -p 80:80 -d --name wyy-cloud-music-container -d wyy-cloud-music:1.0
