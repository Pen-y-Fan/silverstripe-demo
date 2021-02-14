FROM brettt89/silverstripe-web:7.4-apache
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer self-update --2
