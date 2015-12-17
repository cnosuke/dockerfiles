FROM php:5.6-apache

RUN a2enmod rewrite

RUN apt-get update

RUN apt-get install -y zip emacs

# install the PHP extensions we need
RUN apt-get install -y libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd
RUN docker-php-ext-install mysqli

VOLUME /var/www/html

# ENV WORDPRESS_VERSION 4.4
# ENV WORDPRESS_UPSTREAM_VERSION 4.4

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-4.4.tar.gz \
  && tar -xzf wordpress.tar.gz -C /usr/src/ \
  && rm wordpress.tar.gz

COPY docker-entrypoint.sh /entrypoint.sh

RUN chown -R www-data:www-data /usr/src/wordpress

WORKDIR /var/www/html

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
