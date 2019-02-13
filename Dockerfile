FROM php:7.1-fpm-alpine

RUN apk add zlib-dev
RUN docker-php-ext-install zip

RUN apk add libpng-dev libjpeg-turbo-dev
RUN docker-php-ext-install gd

RUN set -ex \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install exif
RUN docker-php-ext-install sockets

RUN apk add autoconf
RUN apk add g++
RUN apk add make
RUN pecl install mongodb
RUN docker-php-ext-enable mongodb
