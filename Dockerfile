FROM kaa67/hostland.ru:latest

RUN mkdir -p /var/www/sitename/htdocs/www
COPY default.conf /etc/apache2/sites-available/000-default.conf
