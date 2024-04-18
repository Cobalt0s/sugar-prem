FROM php:8.2-apache

RUN docker-php-ext-install bcmath


RUN apt-get update && apt-get install -y \
  libzip-dev \
  zip \
  libc-client-dev \
  libkrb5-dev \
  imagemagick \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmagickwand-dev --no-install-recommends \
  libpng-dev \
  && rm -rf /var/lib/apt/lists/* \
  && a2enmod rewrite \
  && docker-php-ext-install exif \
  && docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd \
  && pecl install imagick && docker-php-ext-enable imagick \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install pdo pdo_mysql \
  && docker-php-ext-install zip

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap
RUN docker-php-ext-install soap

COPY ./files/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html/ampersand-sugar

EXPOSE 80
