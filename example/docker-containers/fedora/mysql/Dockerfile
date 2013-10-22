FROM mattdm/fedora:f19
MAINTAINER Krishna Raman <kraman@gmail.com>

# Install mysql-server
RUN yum install -y mysql-server pwgen; yum update -y; sleep 5
ADD start_mysqld.sh /start_mysqld.sh
RUN chmod u+x /start_mysqld.sh

# Bind on 0.0.0.0:3306
ADD mysqld-network.cnf /etc/mysql/conf.d/mysqld-network.cnf
EXPOSE 3306

ENTRYPOINT ["/start_mysqld.sh"]
