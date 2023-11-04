Multiple versions of PHP runing simulteaneosly with Docker.
We also have: MYSQL, Composer, Nodejs for each container of PHP.

- There is the possibility of adding a fake domain in the hosts file.

INSIDE COINTAINERS:

Database:
1. You can copy scripts to ./scripts
2. docker exec -it mysql bash
2.2 Login in mysql: mysql -u root -p
2.3 import db without login: cd docker-entrypoint-initdb.d
2.3.1 mysql -u root -p DATABASE < script.sql

PHP: docker exec -it php7.3 bash
- select project, is the same like any version php ex: php8.2
1. install composer: composer install
2. php artisan

NGINX:
1. go to ./nginx/conf.d/ copy or edit default.conf, replace yourdomain.test by IP or domain, and your version of PHP, i have build docker image as version PHP ex: php7.2, php7.3, php7.4, php8.2
2. replace: fastcgi_pass IMAGEDOCKER-PHP-VERSION:9000; example: fastcgi_pass php7.4:9000;
3. docker exec -it nginx nginx -t //To check if config is OK
4. docker exec -it nginx nginx -s reload

LINUX / WINDOWS domains .test (AS ADMIN-SUDO)

Linux: nano /etc/hosts
Windows: C:\WINDOWS\System32\drivers\etc\hosts (OPEN WITH ANY EDITOR)
add: 
127.0.0.1      yourdomain.test
