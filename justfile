ssh:
	fly ssh console --pty --command="/bin/bash"

backup:
	fly ssh console --command="php /var/www/html/artisan backup:run --only-db"
