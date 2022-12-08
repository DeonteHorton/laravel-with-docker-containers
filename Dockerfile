# FROM php:8.1-fpm-alpine
FROM php:8.1-fpm

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y git nodejs zlib1g-dev libzip-dev unzip supervisor nano cron

RUN docker-php-ext-install pdo pdo_mysql zip sockets pcntl

# WORKDIR /var/www/html/

# RUN composer create-project laravel/laravel . && \
# composer install && \
# cp .env.example .env && \
# php artisan key:generate && \
# composer require laravel/breeze --dev && \
# npm install
# npm run build

# RUN chown -R www-data:www-data storage

EXPOSE 22
# EXPOSE 22 443 80