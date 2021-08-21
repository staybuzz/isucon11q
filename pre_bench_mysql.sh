#!/bin/bash -x
# from: https://gist.github.com/asflash8/0cbb743fd23385f32b412c908959a032
set -ex

if [ -f /var/log/mysql/mysql-slow.log ]; then
    NEW_DATE=$(date "+%Y%m%d_%H%M%S")
    NEW_LOGNAME=/var/log/mysql/mysql-slow.log.${NEW_DATE}
    sudo mv /var/log/mysql/mysql-slow.log $NEW_LOGNAME
    pt-query-digest $NEW_LOGNAME > ~isucon/sqllog/slow.log.${NEW_DATE}
    ln -sf ~isucon/sqllog/slow.log.${NEW_DATE} ~isucon/slow.log
fi
sudo systemctl restart mysql
