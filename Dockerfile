# Use php as base image - will share some common base images with the fpm
# container
FROM php:7.0-fpm

# The entrypoint 
VOLUME /usr/local/etc/php-fpm.d/

RUN apt-get update && apt-get -y install gettext-base \
	&& rm -rf /var/lib/apt/lists/*

COPY php-fpm.d /opt/config/php-fpm.d/
COPY entrypoint /entrypoint

ENTRYPOINT /entrypoint
