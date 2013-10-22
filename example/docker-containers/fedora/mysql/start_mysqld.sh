#!/bin/bash

if [ -z $ROOT_PWD ]; then
  export ROOT_PWD=$(pwgen -s 12 1)
fi

mysql_install_db --user=mysql --ldata=/var/lib/mysql/ 2>&1 > /dev/null
runuser - mysql "/usr/bin/mysqld_safe" &

#wait for mysql
until mysql -e 'select 1'; do sleep 1; done

mysql 2>/dev/null <<EOF
UPDATE mysql.user SET Password=PASSWORD('$ROOT_PWD') WHERE User='root';
GRANT ALL ON *.* to root@'%' IDENTIFIED BY '$ROOT_PWD';
FLUSH PRIVILEGES;
CREATE DATABASE docker;
"
EOF

echo "DONE"
echo "ENV ROOT_PWD=${ROOT_PWD}"
wait
