From ruby:2.2.0
run mkdir /app
workdir app
add . /app
cmd bundic install && bundic exec puma config.ru -p 9090 -e production

from httpd
add lesson2.html /usr/local/apache2/htdocs
cmd ["httpd-foreground"]