docker run --rm -p 3000:3000 --name huginn_mysql \
    -e DATABASE_NAME=huginn \
    -e DATABASE_ADAPTER=mysql2 \
    -e DATABASE_USERNAME=xxxx \
    -e DATABASE_PASSWORD=xxxxx \
    -e DATABASE_HOST=xxxx.mysql.rds.aliyuncs.com \
    huginn/huginn:19fc7480ac1ee8e6528e5dfe903d987569b91486
