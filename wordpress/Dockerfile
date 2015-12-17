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

# setup plugins
WORKDIR /usr/src/wordpress/wp-content/plugins

# install cache enabler to create static html and deliver it via CDN (like keyCDN who is the author of this plugin)
RUN curl -o cache-enabler.zip -SL https://downloads.wordpress.org/plugin/cache-enabler.zip \
  && unzip cache-enabler.zip && rm cache-enabler.zip

RUN curl -o amazon-web-services.zip -SL https://downloads.wordpress.org/plugin/amazon-web-services.zip \
  && unzip amazon-web-services.zip && rm amazon-web-services.zip

RUN curl -o amazon-s3-and-cloudfront.0.9.11.zip -SL https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.0.9.11.zip \
  && unzip amazon-s3-and-cloudfront.0.9.11.zip && rm amazon-s3-and-cloudfront.0.9.11.zip

RUN chown -R www-data:www-data /usr/src/wordpress

WORKDIR /var/www/html

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
