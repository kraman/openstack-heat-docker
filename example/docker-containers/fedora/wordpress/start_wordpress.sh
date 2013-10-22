#!/bin/bash -x

if [ -z $DB_PASSWORD ]; then
  echo "Require DB_PASSWORD variable"
  exit 1
fi

if [ -z $DB_HOSTNAME ]; then
  echo "Require DB_HOSTNAME variable"
  exit 1
fi

if [ -z $DB_PORT ]; then
  echo "Require DB_PORT variable"
  exit 1
fi

if [ -z $AUTH_KEY ]; then
  AUTH_KEY=$(pwgen -s 12 1)
fi

if [ -z $SECURE_AUTH_KEY ]; then
  SECURE_AUTH_KEY=$(pwgen -s 12 1)
fi

if [ -z $LOGGED_IN_KEY ]; then
  LOGGED_IN_KEY=$(pwgen -s 12 1)
fi

if [ -z $NONCE_KEY ]; then
  NONCE_KEY=$(pwgen -s 12 1)
fi

if [ -z $AUTH_SALT ]; then
  AUTH_SALT=$(pwgen -s 12 1)
fi

if [ -z $SECURE_AUTH_SALT ]; then
  SECURE_AUTH_SALT=$(pwgen -s 12 1)
fi

if [ -z $LOGGED_IN_SALT ]; then
  LOGGED_IN_SALT=$(pwgen -s 12 1)
fi

if [ -z $NONCE_SALT ]; then
  NONCE_SALT=$(pwgen -s 12 1)
fi

sed -i "s/GEN_AUTH_KEY/$AUTH_KEY/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_SECURE_AUTH_KEY/$SECURE_AUTH_KEY/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_LOGGED_IN_KEY/$LOGGED_IN_KEY/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_NONCE_KEY/$NONCE_KEY/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_AUTH_SALT/$AUTH_SALT/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_SECURE_AUTH_SALT/$SECURE_AUTH_SALT/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_LOGGED_IN_SALT/$LOGGED_IN_SALT/g" /etc/wordpress/wp-config.php
sed -i "s/GEN_NONCE_SALT/$NONCE_SALT/g" /etc/wordpress/wp-config.php

/usr/sbin/httpd -D FOREGROUND
