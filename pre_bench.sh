#!/bin/bash -x
# from: https://gist.github.com/asflash8/0cbb743fd23385f32b412c908959a032
set -ex

if [ -f /var/log/mysql/mysql-slow.log ]; then
    sudo mv /var/log/mysql/mysql-slow.log /var/log/mysql/mysql-slow.log.$(date "+%Y%m%d_%H%M%S")
fi
if [ -f /var/log/nginx/access.log ]; then
    sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.$(date "+%Y%m%d_%H%M%S")
fi
sudo systemctl restart mysql
# sudo service memcached restart
# bundle install
sudo systemctl restart niita_ruby
sudo systemctl restart nginx