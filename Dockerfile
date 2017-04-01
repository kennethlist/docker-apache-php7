FROM ubuntu:latest

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get install -y \
      locales \
      php7.0 \
      php7.0-cli \
      php7.0-common \
      php7.0-curl \
      php7.0-gd \
      php7.0-intl \
      php7.0-json \
      php7.0-mcrypt \
      php7.0-mysql \
      php7.0-opcache \
      php7.0-pspell \
      php7.0-xmlrpc \
      php7.0-xsl \
      php-xdebug \
      apache2 \
      graphviz \
      libapache2-mod-php7.0\
      ssmtp

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY xdebug.ini /etc/php/7.0/mods-available/xdebug.ini
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
