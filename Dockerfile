ARG PHP_VERSION=8.2
FROM fideloper/fly-laravel:${PHP_VERSION} as base

ARG PHP_VERSION

LABEL fly_launch_runtime="laravel"

# Copy composer files
COPY composer.json composer.lock /var/www/html/

# Install dependencies
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | tee /etc/apt/trusted.gpg.d/pgdg.asc >/dev/null \
    && echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
    && apt update \
    && apt install -y postgresql-client-14 mysql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && composer install --optimize-autoloader --no-dev \
    && echo 'cd /var/www/html' >> /.bashrc

# Copy the rest of the application
COPY . /var/www/html

ENTRYPOINT ["/usr/bin/php", "/var/www/html/artisan", "schedule:work"]
