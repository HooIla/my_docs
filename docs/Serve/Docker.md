# Docker

## 基本操作

``` shell
# 镜像管理
docker images 查看本地镜像
docker pull ubuntu:20.04 拉取镜像
docker rmi image_id 删除镜像
docker rmi $(docker images -q) 删除所有镜像
docker build -t myapp:latest . 构建镜像
docker tag source_image:tag target_image:tag 标记镜像

# 容器管理
docker ps 查看运行中的容器
docker ps -a 查看所有容器
docker run ubuntu:20.04 运行容器
docker run -d nginx 后台运行容器
docker run -it ubuntu:20.04 /bin/bash 交互式运行容器
docker start container_id 启动容器
docker stop container_id 停止容器
docker restart container_id 重启容器
docker rm container_id 删除容器
docker rm $(docker ps -aq) 删除所有容器
```

## 容器运行参数

``` shell
# 端口映射
docker run -p 8080:80 nginx 映射端口8080到容器80端口
docker run -P nginx 随机映射所有暴露端口

# 卷挂载
docker run -v /host/path:/container/path ubuntu 挂载主机目录
docker run -v volume_name:/container/path ubuntu 使用命名卷
docker run --mount type=bind,source=/host/path,target=/container/path ubuntu 绑定挂载

# 环境变量
docker run -e VAR_NAME=value ubuntu 设置环境变量
docker run --env-file .env ubuntu 从文件加载环境变量

# 网络配置
docker run --network=bridge ubuntu 指定网络模式
docker run --network=host ubuntu 使用主机网络
docker run --link container_name:alias ubuntu 链接容器

# 资源限制
docker run -m 512m ubuntu 限制内存512MB
docker run --cpus="1.5" ubuntu 限制CPU使用
docker run --restart=always ubuntu 设置重启策略
```

## 容器操作

``` shell
# 进入容器
docker exec -it container_id /bin/bash 进入运行中的容器
docker attach container_id 附加到容器主进程

# 文件操作
docker cp file.txt container_id:/path/ 复制文件到容器
docker cp container_id:/path/file.txt . 从容器复制文件

# 查看信息
docker logs container_id 查看容器日志
docker logs -f container_id 实时查看日志
docker inspect container_id 查看容器详细信息
docker stats 查看容器资源使用情况
docker top container_id 查看容器进程
```

## 镜像构建

``` shell
# Dockerfile常用指令
FROM ubuntu:20.04 基础镜像
MAINTAINER author@email.com 维护者信息
RUN apt-get update 执行命令
COPY file.txt /app/ 复制文件
ADD archive.tar.gz /app/ 添加文件(支持解压)
WORKDIR /app 设置工作目录
EXPOSE 80 暴露端口
ENV VAR_NAME=value 设置环境变量
USER username 切换用户
VOLUME /data 定义卷
CMD ["executable","param1"] 默认执行命令
ENTRYPOINT ["executable"] 容器启动命令

# 构建参数
docker build . 使用当前目录Dockerfile构建
docker build -f custom.dockerfile . 指定Dockerfile
docker build --no-cache . 不使用缓存构建
docker build --build-arg VAR=value . 传递构建参数
```

## 卷管理

``` shell
# 卷操作
docker volume ls 列出所有卷
docker volume create volume_name 创建卷
docker volume inspect volume_name 查看卷详情
docker volume rm volume_name 删除卷
docker volume prune 删除未使用的卷

# 卷挂载类型
bind mount 绑定挂载主机路径
named volume 命名卷(Docker管理)
tmpfs mount 临时文件系统挂载(仅内存)
```

## 网络管理

``` shell
# 网络操作
docker network ls 列出网络
docker network create network_name 创建网络
docker network inspect network_name 查看网络详情
docker network rm network_name 删除网络
docker network prune 删除未使用网络

# 网络模式
bridge 桥接网络(默认)
host 主机网络
none 无网络
container:name 共享其他容器网络

# 连接网络
docker network connect network_name container_name 连接容器到网络
docker network disconnect network_name container_name 断开网络连接
```

## Docker Compose

``` shell
# 基本命令
docker compose up 启动服务
docker compose up -d 后台启动服务
docker compose down 停止并删除服务
docker compose start 启动已存在服务
docker compose stop 停止服务
docker compose restart 重启服务
docker compose pause 暂停服务
docker compose unpause 恢复服务

# 构建和拉取
docker compose build 构建服务镜像
docker compose pull 拉取服务镜像
docker compose up --build 构建并启动

# 日志和状态
docker compose logs 查看所有服务日志
docker compose logs service_name 查看指定服务日志
docker compose logs -f 实时查看日志
docker compose ps 查看服务状态
docker compose top 查看服务进程
```

## Compose文件配置

```yaml
# compose.yml示例
version: '3.8'

services:
  web:
    build: .                    # 构建配置
    image: nginx:latest         # 使用镜像
    container_name: web_app     # 容器名称
    ports:
      - "8080:80"              # 端口映射
    volumes:
      - ./app:/var/www/html    # 卷挂载
      - data_volume:/data      # 命名卷
    environment:
      - NODE_ENV=production    # 环境变量
    env_file:
      - .env                   # 环境变量文件
    depends_on:
      - db                     # 依赖关系
    networks:
      - app_network           # 自定义网络
    restart: unless-stopped   # 重启策略

  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
    volumes:
      - db_data:/var/lib/mysql

volumes:
  data_volume:               # 定义命名卷
  db_data:

networks:
  app_network:              # 定义网络
    driver: bridge
```

## 服务管理

``` shell
# 扩容和缩容
docker compose up --scale service_name=3 扩容服务到3个实例
docker compose scale service_name=2 缩容服务到2个实例

# 执行命令
docker compose exec service_name bash 在服务中执行命令
docker compose run service_name command 运行一次性命令

# 配置管理
docker compose config 验证并查看配置
docker compose -f custom.yml up 指定配置文件
docker compose --env-file .env up 指定环境变量文件
```

## 实用技巧

``` shell
# 清理操作
docker system prune 清理未使用资源
docker system prune -a 清理所有未使用资源
docker image prune 清理悬空镜像
docker container prune 清理停止的容器

# 导入导出
docker save -o image.tar image_name 导出镜像
docker load -i image.tar 导入镜像
docker export container_id > container.tar 导出容器
docker import container.tar new_image:tag 导入容器为镜像

# 系统信息
docker version 查看版本信息
docker info 查看系统信息
docker system df 查看磁盘使用情况

# 多阶段构建
FROM node:16 AS build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
```

## 健康检查

``` shell
# Dockerfile中定义
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# docker-compose.yml中定义
services:
  web:
    image: nginx
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s

# 查看健康状态
docker ps 查看健康状态
docker inspect container_id 查看详细健康信息
```