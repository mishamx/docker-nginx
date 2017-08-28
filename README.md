# Dockerize nginx

## Run

`docker run --name docker-nginx -p 80:80 mishamx/nginx -d -v ./html:/var/www/html/`

## Compose

Docker compose file
```
version: '3'

services:
    nginx:
        image: mishamx/nginx
        volumes:
            - ./html:/var/www/html/
        ports:
            - "80:80"

```