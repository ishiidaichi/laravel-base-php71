FROM php:7.1-fpm-alpine

RUN apk add zlib-dev
RUN docker-php-ext-install zip

RUN apk add libpng-dev
RUN docker-php-ext-install gd

RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql

RUN apk add imagemagick-dev
RUN apk add autoconf
RUN apk add g++
RUN apk add make
RUN pecl install imagick
RUN docker-php-ext-enable imagick
