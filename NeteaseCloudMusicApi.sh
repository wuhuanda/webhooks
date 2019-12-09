#!/bin/bash
WORK_PATH='~/workplace/NeteaseCloudMusicApi'
cd $WORK_PATH
echo "清理代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "开始构建镜像"
docker build -t NeteaseCloudMusicApi:1.0 .
echo "删除旧容器"
docker stop NeteaseCloudMusicApi-container
docker rm NeteaseCloudMusicApi-container
echo "启动新容器"
docker container run -p 3000:3000 -d --name NeteaseCloudMusicApi-container NeteaseCloudMusicApi:1.0