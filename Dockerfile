FROM php:7.4-apache

RUN a2enmod rewrite

RUN apt-get update \
    && apt-get install -y \
        libfreetype-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && apt-get clean
