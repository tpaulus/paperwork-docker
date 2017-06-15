Paperwork - Docker
==================

Based off of [ConorIA](https://github.com/ConorIA)'s Paperwork Dockerfile
and related setup.

## Build the Image
If you are building the image from the source Dockerfile, run the following
command to build the image. This can take a little depending on your
network connection, and the horesepower of the building system.

```sh
docker build https://github.com/tpaulus/paperwork-docker -t tpaulus/paperwork-docker
```

## Container Creation
This container assumes that you have a MySQL DB provisioned outside of the
container, like in a separate docker instance. Provide the necessary
configuration via the environment variables listed

```sh
docker create --name paperwork \
  -e DB_PORT_3306_TCP_ADDR=host \
  -e DB_ENV_MYSQL_DATABASE=db_name \
  -e DB_ENV_MYSQL_USER=username \
  -e DB_ENV_MYSQL_PASSWORD=password \
  -e DB_PORT_3306_TCP_PORT=3306 \
  -p 80:80 \
  -v /etc/docker/paperwork:/app/app/storage/ \
  tpaulus/paperwork-docker
```

The start the container via:
```sh
docker start paperwork
```
