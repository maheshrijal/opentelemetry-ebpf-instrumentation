FROM composer:2.11@sha256:537fb03057ed901ae06bde7ef25af348903485ae1acc7fc789b80d8bac666f35 AS dependencies

WORKDIR /app
COPY internal/test/integration/components/php/harvest/laravel/composer.json internal/test/integration/components/php/harvest/laravel/composer.lock ./
RUN composer install --no-dev --no-interaction --no-scripts --prefer-dist

FROM php:8.6.0-fpm@sha256:86d71b5bb7e20a81d20ee8b07b0d80eb63daae39a51a4a65d90b1c416b023be2

WORKDIR /var/www/laravel
COPY --from=dependencies /app/vendor ./vendor
COPY internal/test/integration/components/php/harvest/laravel/composer.json internal/test/integration/components/php/harvest/laravel/composer.lock ./
COPY internal/test/integration/components/php/harvest/laravel/app ./app
COPY internal/test/integration/components/php/harvest/laravel/bootstrap ./bootstrap
COPY internal/test/integration/components/php/harvest/laravel/public ./public
COPY internal/test/integration/components/php/harvest/laravel/routes ./routes
COPY internal/test/integration/components/php/harvest/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
RUN mkdir -p bootstrap/cache storage/framework/cache storage/framework/sessions storage/framework/views storage/logs && chown -R www-data:www-data bootstrap/cache storage
