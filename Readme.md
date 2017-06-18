Paperwork - Docker
==================

Based off of [Tomohisa Kusano](https://github.com/siomiz/paperwork)'s Paperwork Dockerfile
and related setup.

## Container Creation
This container assumes that you have a MySQL DB provisioned outside of the
container, like in a separate docker instance. Provide the necessary
configuration, like DB Credentials during the Paperwork setup process.

```sh
docker create --name paperwork \
  -p 80:80 \
  tpaulus/paperwork-docker
```

The start the container via:
```sh
docker start paperwork
```

## Build the Image
If you are building the image from the source Dockerfile, run the following
command to build the image. This can take a little depending on your
network connection, and the horsepower of the building system.

```sh
docker build https://github.com/tpaulus/paperwork-docker -t tpaulus/paperwork-docker
```
