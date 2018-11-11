FROM php:7.2.12-fpm-alpine3.8

LABEL maintainer="Wangshuai <wangshuai@hexindai.com>"

# install hexindai extensions
RUN set -xe \
      && apk add --no-cache --virtual .build-hexindai-deps \
                autoconf \
                freetype-dev \
                libjpeg-turbo-dev \
                libpng-dev \
                bzip2-dev \
                icu-dev \
                openldap-dev \
                libxml2-dev \
                tidyhtml-dev \
                libxslt-dev \
                libmemcached-dev \
                zlib-dev \
      && docker-php-ext-configure gd \
                --with-freetype-dir=/usr/include/ \
                --with-jpeg-dir=/usr/include/ \
                --with-png-dir=/usr/include/ \
      && docker-php-ext-install gd \
                bcmath \
                bz2 \
                calendar \
                pdo \
                pdo_mysql \
                dba \
                exif \
                intl \
                ldap \
                mysqli \
                pcntl \
                shmop \
                soap \
                sockets \
                sysvmsg \
                sysvsem \
                sysvshm \
                tidy \
                wddx \
                xmlrpc \
                xsl \
                zip \
      && pecl install memcached \
      && pecl install redis \
      && docker-php-ext-enable memcached redis \
      && apk del .build-hexindai-deps
