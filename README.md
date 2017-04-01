docker run -d -p 8080:80 \
    -v /path/www:/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' \
    --name php7 \
    --link mailhog \
    docker-php7

docker run -d -p 1025:1025 -p 8025:8025 \
	--name mailhog \
	mailhog/mailhog

docker run --name mariadb -p 3301:3306 \
    -v /path/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=password \
    -d mariadb:latest