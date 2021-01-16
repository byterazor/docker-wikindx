# docker-wikindx

## Description

This repository contains everything required to build a docker image for
run https://wikindx.sourceforge.io/ under docker.

The documentation and the Dockerfile are work in progress.

The main git repository for this project is: https://gitea.federationhq.de/byterazor/docker-wikindx

### Restrictions

At the moment only a mysql server within this container can be used.
*No* support for external database server is available at the moment.

Therefore, the local database is not exposed to the outside and runs
on *unsecure* default credentials right now!

## Author

- Dominik Meyer <dmeyer@federationhq.de>

## License

The Dockerfile and related files in this repository are licensed under
the GPLv3.

## Install

### Docker hub

- docker pull byterazor/wikindx:latest
- docker run -p 8080:80 -v /tmp/data:/var/lib/mysql -v /tmp/wikindx:/var/www/html/wikindx

Then connect to localhost:8080.

### from repository

- git clone https://gitea.federationhq.de/byterazor/docker-wikindx.git
- cd docker-wikindx
- docker build -t wikindx:latest .
- docker run -p 8080:80 -v /tmp/data:/var/lib/mysql -v /tmp/wikindx:/var/www/html/wikindx

Then connect to localhost:8080.
