FROM php:7-apache-buster
WORKDIR /home/
RUN sed -i 's/deb.debian.org/ftp.de.debian.org/g' /etc/apt/sources.list
RUN apt-get -q -y update && apt-get -q -y upgrade
RUN apt-get -q -y install default-libmysqlclient-dev wget mariadb-server
RUN apt-get -q -y install libpng-dev libicu-dev bibutils libzip-dev
RUN apt-get -q -y install libldap2-dev
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install gd && docker-php-ext-enable gd
RUN docker-php-ext-install gettext && docker-php-ext-enable gettext
RUN docker-php-ext-install intl && docker-php-ext-enable intl
RUN docker-php-ext-install zip && docker-php-ext-enable zip
RUN docker-php-ext-install ldap && docker-php-ext-enable ldap
RUN wget -O wikindx.tar.bz2 https://sourceforge.net/projects/wikindx/files/latest/download
RUN tar jxf wikindx.tar.bz2
RUN cp wikindx/config.php.dist wikindx/config.php
COPY create.sql .
COPY docker-entrypoint-wikindx /usr/local/bin/
RUN chown www-data.www-data wikindx -R

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -i 's/post_max_size.=.*/post_max_size = 100M/' /usr/local/etc/php/php.ini
RUN sed -i 's/upload_max_filesize.=.*/upload_max_filesize = 100M/' /usr/local/etc/php/php.ini
RUN echo "mysql.default_socket = /var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini
RUN echo "mysqli.default_socket = /var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini

VOLUME ["/var/lib/mysql"]
VOLUME ["/home/wikindx"]

ENTRYPOINT ["docker-entrypoint-wikindx"]
