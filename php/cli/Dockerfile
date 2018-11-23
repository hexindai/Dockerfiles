FROM php:7.2.12-cli-alpine3.8

LABEL maintainer="Wangshuai <wangshuai@hexindai.com>"

RUN apk add --no-cache --virtual .persistent-deps \
            libbz2 \
            libpng \
            libjpeg-turbo \
            freetype \
            icu \
            libldap \
            libmemcached \
            tidyhtml \
            libxslt

# install hexindai extensions
RUN set -xe \
      && apk add --no-cache --virtual .build-hexindai-deps $PHPIZE_DEPS \
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
      && pecl install memcached redis xdebug \
      && docker-php-ext-enable memcached redis xdebug \
      && apk del .build-hexindai-deps \
      && docker-php-source delete

COPY php.ini /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php \
      && mv composer.phar /usr/local/bin/composer

USER www-data:www-data
