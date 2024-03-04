FROM kaa67/hostland.ru:latest

RUN mkdir -p /var/www/sitename/htdocs/www
COPY default.conf /etc/apache2/sites-available/000-default.conf

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www
COPY --chown=www:www . /var/www
USER www
