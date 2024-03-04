FROM php:8.2-apache

RUN apt-get update

RUN apt-get install -y libbz2-dev mc
RUN apt-get install -y libc-client-dev libkrb5-dev
RUN apt-get install -y libldap2-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libtidy-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libmemcached-dev zlib1g-dev
RUN apt-get install -y libmagickwand-dev --no-install-recommends
RUN apt-get install -y libxml2-dev && apt-get clean -y

RUN pecl install -o -f redis &&  rm -rf /tmp/pear &&  docker-php-ext-enable redis
RUN docker-php-ext-install soap
RUN pecl install imagick && docker-php-ext-enable imagick && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-install ldap
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-install zip
RUN docker-php-ext-install gmp
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install bz2
RUN docker-php-ext-install calendar
RUN docker-php-ext-install exif
RUN docker-php-ext-install gettext
RUN docker-php-ext-install sysvsem
RUN docker-php-ext-install sysvshm
RUN docker-php-ext-install sockets
RUN docker-php-ext-install shmop
RUN docker-php-ext-install tidy
RUN docker-php-ext-install xsl
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN pecl install xdebug && docker-php-ext-enable xdebug

# PHP ext-memcache
ARG PHPEXT_MEMCACHE_VERSION=8.2
RUN set -eux; \
  persistentDeps=" \
    libzip4 \
  "; \
  buildDeps=" \
    libzip-dev \
  "; \
  DEBIAN_FRONTEND=noninteractive apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ${persistentDeps} \
    ${buildDeps} \
  ; \
  \
  pecl bundle -d /usr/src/php/ext memcache-${PHPEXT_MEMCACHE_VERSION}; \
  docker-php-ext-install -j$(nproc) memcache; \
  \
  DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove \
    -o APT::AutoRemove::RecommendsImportant=false \
    -o APT::AutoRemove::SuggestsImportant=false \
    ${buildDeps} \
  ; \
  docker-php-source delete; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl install mongodb
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/php.ini
RUN docker-php-ext-install -j$(nproc) opcache
RUN echo 'ServerName localhost:80' >> /etc/apache2/apache2.conf
RUN a2enmod rewrite

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www
USER www
