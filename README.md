# wp-docker

create a wordpress app inside docker
with mysql and phpmyadmin

## Usage

```bash
$ docker-compose up -d
```

### php/php.ini

copies the file php.ini into the php folder to the container

```php
file_uploads = On
memory_limit = 64M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 600
```

it's also possible to copy the themes and plugins, to do this you need to create the /wp-content folder and within this create the /themes and /plugins folders
