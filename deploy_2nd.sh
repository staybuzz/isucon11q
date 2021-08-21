#!/bin/bash -x
APP_NAME=webapp
APP_ROOT=/home/isucon/${APP_NAME}
cd $APP_ROOT

# update repo
#git pull origin master
#git pull origin develop

# nginx
#sudo cp -r configs/nginx/* /etc/nginx/


# mysql
#sudo cp configs/mysql/my.cnf /etc/mysql/my.cnf
sudo cp -r configs/mysql/* /etc/mysql/

# sysctl
sudo cp configs/sysctl.conf /etc/sysctl.conf
sudo sysctl -p

# service
#sudo cp configs/isucondition.python.service /etc/systemd/system/isucondition.python.service
#sudo systemctl daemon-reload

# log-lotate and restart services
sudo ./pre_bench_mysql.sh
