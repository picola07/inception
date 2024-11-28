#!/bin/bash

# mkdir -p /var/run/mysqld
# chown -R mysql:mysql /var/run/mysqld


# if [ ! -d "/var/lib/mysql/mysql" ]; then 
#     echo "initializing database..."
#     mysql_install_db --user=mysql --ldata=/var/lib/mysql
# fi

service mysql start


echo "CREATE DATABASE IF NOT EXISTS wpdb ;" > db.sql
echo "CREATE USER IF NOT EXISTS 'mysql_user'@'%' IDENTIFIED BY '1234' ;" >> db.sql  
echo "GRANT ALL PRIVILEGES ON wpdb.* TO 'mysql_user'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db.sql
echo "FLUSH PRiVILEGES;" >> db.sql

mysql < db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

exec mysqld
