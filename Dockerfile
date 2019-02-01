FROM php:7.1-fpm-alpine

RUN apk add zlib-dev
RUN docker-php-ext-install zip

RUN apk add libpng-dev
RUN docker-php-ext-install gd

RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install exif
RUN docker-php-ext-install sockets

RUN apk add imagemagick-dev
RUN apk add autoconf
RUN apk add g++
RUN apk add make
RUN pecl install imagick
RUN pecl install mongodb
RUN docker-php-ext-enable imagick
RUN docker-php-ext-enable mongodb
