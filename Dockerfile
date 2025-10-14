FROM php:8.4-fpm

# Установим зависимости
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev libpq-dev zip && \
    docker-php-ext-install pdo pdo_mysql zip

# Установим Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
