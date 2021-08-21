#!/bin/bash -x
APP_NAME=webapp
APP_ROOT=/home/isucon/${APP_NAME}
cd $APP_ROOT

# update repo
git pull origin master

# nginx
sudo cp -r configs/nginx /etc/nginx


# mysql
#sudo cp configs/mysql/my.cnf /etc/mysql/my.cnf
sudo cp configs/mysql /etc/mysql

# log-lotate and restart services
./pre_bench.sh