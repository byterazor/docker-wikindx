FROM php:7-apache-buster
WORKDIR /var/www/html
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
WORKDIR /tmp
RUN wget -O wikindx_plugin_visualize_344.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_plugin_visualize_344.tar.gz/download
RUN wget -O wikindx_plugin_userwritecategory_344.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_plugin_userwritecategory_344.tar.gz/download
RUN wget -O wikindx_plugin_importexportbib_344.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_plugin_importexportbib_344.tar.gz/download
RUN wget -O wikindx_plugin_wordprocessor_344.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_plugin_wordprocessor_344.tar.gz/download
RUN wget -O wikindx_vendor_tinymce_235.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_tinymce_235.tar.gz/download
RUN wget -O wikindx_vendor_smarty_223.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_smarty_223.tar.gz/download
RUN wget -O wikindx_vendor_rtftools_337.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_rtftools_337.tar.gz/download
RUN wget -O wikindx_vendor_phpmailer_337.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_phpmailer_337.tar.gz/download
RUN wget -O wikindx_vendor_progressbarjs_175.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_progressbarjs_175.tar.gz/download
RUN wget -O wikindx_vendor_pdftotext_175.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_pdftotext_175.tar.gz/download
RUN wget -O wikindx_vendor_licenses_191.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_licenses_191.tar.gz/download
RUN wget -O wikindx_vendor_jquery_175.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_jquery_175.tar.gz/download
RUN wget -O wikindx_vendor_jsonjs_175.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_vendor_jsonjs_175.tar.gz/download
RUN wget -O wikindx_template_verticalorange_235.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_verticalorange_235.tar.gz/download
RUN wget -O wikindx_template_simpleblue_250.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_simpleblue_250.tar.gz/download
RUN wget -O wikindx_template_piaf_250.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_piaf_250.tar.gz/download
RUN wget -O wikindx_template_enluminure_235.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_enluminure_235.tar.gz/download
RUN wget -O wikindx_template_default_337.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_default_337.tar.gz/download
RUN wget -O wikindx_template_carambola_250.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_carambola_250.tar.gz/download
RUN wget -O wikindx_template_bryophyta_250.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_template_bryophyta_250.tar.gz/download
RUN wget -O wikindx_style_mla_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_mla_213.tar.gz/download
RUN wget -O wikindx_style_turabian_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_turabian_213.tar.gz/download
RUN wget -O wikindx_style_wikindx_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_wikindx_213.tar.gz/download
RUN wget -O wikindx_style_cfb_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_cfb_213.tar.gz/download
RUN wget -O wikindx_style_chicago_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_chicago_213.tar.gz/download
RUN wget -O wikindx_style_harvard_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_harvard_213.tar.gz/download
RUN wget -O wikindx_style_ieee_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_ieee_213.tar.gz/download
RUN wget -O wikindx_style_apa_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_apa_213.tar.gz/download
RUN wget -O wikindx_style_britishmedicaljournal_213.tar.gz https://sourceforge.net/projects/wikindx/files/current_release/components/wikindx_style_britishmedicaljournal_213.tar.gz/download
RUN mkdir -p /var/www/html/wikindx/components/plugins
RUN mkdir -p /var/www/html/wikindx/components/vendors
RUN mkdir -p /var/www/html/wikindx/components/templates
RUN mkdir -p /var/www/html/wikindx/components/styles
WORKDIR /var/www/html/wikindx/components/plugins
RUN tar zxf /tmp/wikindx_plugin_visualize_344.tar.gz
RUN tar zxf /tmp/wikindx_plugin_userwritecategory_344.tar.gz
RUN tar zxf /tmp/wikindx_plugin_importexportbib_344.tar.gz
RUN tar zxf /tmp/wikindx_plugin_wordprocessor_344.tar.gz
WORKDIR /var/www/html/wikindx/components/vendors
RUN tar zxf /tmp/wikindx_vendor_tinymce_235.tar.gz
RUN tar zxf /tmp/wikindx_vendor_smarty_223.tar.gz
RUN tar zxf /tmp/wikindx_vendor_rtftools_337.tar.gz
RUN tar zxf /tmp/wikindx_vendor_phpmailer_337.tar.gz
RUN tar zxf /tmp/wikindx_vendor_progressbarjs_175.tar.gz
RUN tar zxf /tmp/wikindx_vendor_pdftotext_175.tar.gz
RUN tar zxf /tmp/wikindx_vendor_licenses_191.tar.gz
RUN tar zxf /tmp/wikindx_vendor_jquery_175.tar.gz
RUN tar zxf /tmp/wikindx_vendor_jsonjs_175.tar.gz
WORKDIR /var/www/html/wikindx/components/templates
RUN tar zxf /tmp/wikindx_template_verticalorange_235.tar.gz
RUN tar zxf /tmp/wikindx_template_simpleblue_250.tar.gz
RUN tar zxf /tmp/wikindx_template_piaf_250.tar.gz
RUN tar zxf /tmp/wikindx_template_enluminure_235.tar.gz
RUN tar zxf /tmp/wikindx_template_default_337.tar.gz
RUN tar zxf /tmp/wikindx_template_carambola_250.tar.gz
RUN tar zxf /tmp/wikindx_template_bryophyta_250.tar.gz
WORKDIR /var/www/html/wikindx/components/styles
RUN tar zxf /tmp/wikindx_style_mla_213.tar.gz
RUN tar zxf /tmp/wikindx_style_turabian_213.tar.gz
RUN tar zxf /tmp/wikindx_style_wikindx_213.tar.gz
RUN tar zxf /tmp/wikindx_style_cfb_213.tar.gz
RUN tar zxf /tmp/wikindx_style_chicago_213.tar.gz
RUN tar zxf /tmp/wikindx_style_harvard_213.tar.gz
RUN tar zxf /tmp/wikindx_style_ieee_213.tar.gz
RUN tar zxf /tmp/wikindx_style_apa_213.tar.gz
RUN tar zxf /tmp/wikindx_style_britishmedicaljournal_213.tar.gz
WORKDIR /var/www/html
RUN cp wikindx/config.php.dist wikindx/config.php
COPY create.sql .
COPY docker-entrypoint-wikindx /usr/local/bin/
RUN chown www-data.www-data wikindx -R
RUN echo "mysql.default_socket = /var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini
RUN echo "mysqli.default_socket = /var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini

VOLUME ["/var/lib/mysql"]
VOLUME ["/var/www/html/wikindx"]

ENTRYPOINT ["docker-entrypoint-wikindx"]
