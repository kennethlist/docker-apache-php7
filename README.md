docker run -d -p 8004:80 \
    -v /path/www:/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' \
    --name php7 \
    --link mailhog \
    docker-php7

docker run -d -p 1026:1025 -p 8026:8025 \
	--name mailhog \
	mailhog/mailhog