FROM php:8.2-apache

RUN docker-php-ext-install bcmath


RUN apt-get update && apt-get install -y \
  libzip-dev \
  zip \
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


#RUN apt update && echo y | apt install default-mysql-server

COPY ./files/apache2.conf /etc/apache2/apache2.conf
COPY ./files/autoindex.conf /etc/apache2/mods-enabled/autoindex.conf

# TODO some permissions are different
# https://support.sugarcrm.com/documentation/sugar_versions/13.0/ent/installation_and_upgrade_guide/#Linux_Server_Installation_Requirements
#COPY --chmod=775 . /var/www/html/ampersand-sugar FIXME as of now we mount, permissions are preserved as on host
WORKDIR /var/www/html/ampersand-sugar

EXPOSE 80
