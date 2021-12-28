FROM wordpress:latest

# Updating the configuration of wordpress image with our own
COPY php/php.ini /usr/local/etc/php/conf.d/wordpress.ini

# Cleanout built-in themes and plugins.
RUN  rm -R $(ls -1 -d /usr/src/wordpress/wp-content/plugins/*) \
    && rm -R $(ls -1 -d /usr/src/wordpress/wp-content/themes/*)

# Copying Themes and Plugins into the wordpress image
WORKDIR /usr/src/wordpress
RUN set -eux; \
    find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
    cp -s wp-config-docker.php wp-config.php
COPY wp-content/themes/ ./wp-content/themes
COPY wp-content/plugins/ ./wp-content/plugins
