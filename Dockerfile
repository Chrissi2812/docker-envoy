FROM php:7.3

MAINTAINER Chrissi2812

RUN apt-get update && apt-get install -y --no-install-recommends -qq curl libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev zip libzip-dev && \
docker-php-ext-configure zip --with-libzip && \
docker-php-ext-install pdo_mysql zip && \
curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
apt-get purge -y curl && \
apt-get clean -y
