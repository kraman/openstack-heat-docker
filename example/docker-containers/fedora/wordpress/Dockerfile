FROM mattdm/fedora:f19
MAINTAINER Krishna Raman <kraman@gmail.com>

# Install wordpress
RUN yum update -y; yum install -y wordpress pwgen;
ADD wp-config.php /etc/wordpress/wp-config.php
RUN chmod 655 /etc/wordpress/wp-config.php
ADD wordpress.conf /etc/httpd/conf.d/wordpress.conf
ADD start_wordpress.sh /start_wordpress.sh
RUN chmod u+x /start_wordpress.sh

EXPOSE 80

ENTRYPOINT ["/start_wordpress.sh"]
