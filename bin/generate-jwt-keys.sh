#!/bin/bash

CURDIR=`dirname $0`
mkdir -p ${CURDIR}/../config/jwt
openssl genrsa -out ${CURDIR}/../config/jwt/private.pem -passout pass:$1 -aes256 4096
openssl rsa -pubout -in ${CURDIR}/../config/jwt/private.pem -out ${CURDIR}/../config/jwt/public.pem -passin pass:$1
chown -R www-data:www-data ${CURDIR}/../config/jwt



#openssl genrsa -out /etc/apache2/ssl/server.key 4096
#cp /etc/apache2/ssl/server.key /etc/apache2/ssl/server.key.org
#openssl rsa -in /etc/apache2/ssl/server.key.org -out /etc/apache2/ssl/server.key
## Create the Certificate Signing Request file
#openssl req -new -key /etc/apache2/ssl/server.key -out /etc/apache2/ssl/server.csr
#openssl x509 -req -days 365 -in /etc/apache2/ssl/server.csr -signkey /etc/apache2/ssl/server.key -out /etc/apache2/ssl/server.crt
#chmod 440 /etc/apache2/ssl/server.key
#
#openssl genrsa -out server.key 4096
#cp server.key server.key.org
#openssl rsa -in server.key.org -out server.key
## Create the Certificate Signing Request file
#openssl req -new -key server.key -out server.csr
#openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
#chmod 440 server.key