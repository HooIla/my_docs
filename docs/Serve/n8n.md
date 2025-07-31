# n8n



## docker 部署

``` shell
docker volume create n8n_data

docker run -d \
-it \
--name n8n \
-p 5678:5678 \
-v n8n_data:/home/node/.n8n \
docker.n8n.io/n8nio/n8n

```



## 汉化

``` shell
mkdir -p /u01/data/n8n_i18n
cd /u01/data/n8n_i18n

# https://github.com/other-blowsnow/n8n-i18n-chinese.git
wget https://github.com/other-blowsnow/n8n-i18n-chinese/releases/download/n8n%401.90.2/editor-ui.tar.gz
tar -zxvf editor-ui.tar.gz


# 启动
docker run -d \
--name n8n \
-p 5678:5678 \
-v n8n_data:/home/node/.n8n \
-v /u01/data/n8n_i18n/dist:/usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist \
-e N8N_DEFAULT_LOCALE=zh-CN \
-e N8N_SECURE_COOKIE=false \
-e N8N_RUNNERS_ENABLED=true \
-e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true \
docker.n8n.io/n8nio/n8n

```



