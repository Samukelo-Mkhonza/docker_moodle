# Use the official PHP Apache base image
FROM php:8.0-apache

# Install PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libicu-dev \
    libxslt-dev \
    libonig-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip intl xsl mbstring pdo pdo_mysql

# Create necessary directories
RUN mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy Moodle source code to the web root
COPY ./moodle /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Environment variables
ENV MOODLE_DATABASE_TYPE=mariadb \
    MOODLE_DATABASE_HOST=db \
    MOODLE_DATABASE_NAME=moodle \
    MOODLE_DATABASE_USER=moodleuser \
    MOODLE_DATABASE_PASSWORD=moodlepass

# Expose necessary ports
EXPOSE 80 443

# Start Apache
CMD ["apache2-foreground"]
