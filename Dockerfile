FROM php:8.5-apache

RUN docker-php-ext-install mysqli pdo_mysql

# Ocultar warnings y notices de Adminer
RUN echo "error_reporting = E_ALL & ~E_WARNING & ~E_NOTICE & ~E_DEPRECATED" \
    > /usr/local/etc/php/conf.d/adminer-warnings.ini \
 && echo "display_errors = Off" \
    >> /usr/local/etc/php/conf.d/adminer-warnings.ini

COPY ./ /var/www/html/
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
