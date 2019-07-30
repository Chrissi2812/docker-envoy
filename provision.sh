# Install stuff
apt-get update && apt-get install -y --no-install-recommends -qq \
 curl \
 openssh-client \
 libjpeg-dev \
 libpng-dev \
 libfreetype6-dev \
 libbz2-dev \
 unzip \
 zip \
 libzip-dev

# Install ssh server
apt-get install -y --no-install-recommends pwgen openssl

# disable warning about COMPOSer running as root
export COMPOSER_ALLOW_SUPERUSER=1

# Configure php extensions
docker-php-ext-configure zip --with-libzip

# Install php extensions
docker-php-ext-install pdo_mysql zip

# Use Production php settings
mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install Composer
curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

/usr/local/bin/composer global require hirak/prestissimo
/usr/local/bin/composer global require "laravel/envoy=~1.0"

# Clean up unused files
apt-get purge -y curl openssl pwgen
apt-get autoremove -y
apt-get clean -y
