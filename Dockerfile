# Use the latest official PHP with Apache
FROM php:8.2-apache

# Enable Apache rewrite module (optional)
RUN a2enmod rewrite

# Copy your source code
COPY src/ /var/www/html/

# Fix permissions
RUN chown -R www-data:www-data /var/www/html