# Imagen base con Apache y PHP
FROM php:8.0-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo_mysql

# Copiar archivos del proyecto
COPY ./ /var/www/html/

# Permisos adecuados
RUN chown -R www-data:www-data /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto para Apache
CMD ["apache2-foreground"]
