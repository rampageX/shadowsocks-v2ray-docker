# shadowsocks-obfs-docker

Shadowsocks-libev server with simple-obfs running in Docker.

[![Docker Automated build](https://img.shields.io/docker/automated/boris1993/shadowsocks-obfs-docker.svg)](https://hub.docker.com/r/boris1993/shadowsocks-obfs-docker/)
[![shadowsocks-obfs-docker metadata](https://images.microbadger.com/badges/image/boris1993/shadowsocks-obfs-docker:v3.2.3-0.0.5.svg)](https://microbadger.com/images/boris1993/shadowsocks-obfs-docker:v3.2.3-0.0.5)
[![shadowsocks-obfs-docker tag](https://images.microbadger.com/badges/version/boris1993/shadowsocks-obfs-docker:v3.2.3-0.0.5.svg)](https://microbadger.com/images/boris1993/shadowsocks-obfs-docker:v3.2.3-0.0.5)

---

## Current version

+ [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev): 3.2.3
+ [simple-obfs](https://github.com/shadowsocks/simple-obfs): 0.0.5

## Usage

I recommend use a specified tag instead of the "latest" tag. [This article explained why](https://medium.com/@mccode/the-misunderstood-docker-tag-latest-af3babfd6375).

+ Start the container

```bash
docker run \
    -d \
    --restart always \
    -p <server_address>:<server_port>:1080 \
    -e PASSWORD=<password> \
    boris1993/shadowsocks-obfs-docker:v3.2.3-0.0.5
```

Then allow the port used by the shadowsocks in your firewall.

+ With docker-compose

```yaml
---
version: '3'

services:
  shadowsocks-obfs-docker:
    image: boris1993/shadowsocks-obfs-docker:v3.2.3-0.0.5
    restart: always
    ports:
      - <server_address>:<server_port>:1080
    environment:
      PASSWORD: <password>
```

+ Specifying additional arguments

You can also add additional arguments by specifying the environment variable `ARGS`, like `-e ARGS=<arguments>` in the script, or

```yaml
environment:
  ARGS: <arguments>
```

in `docker-compose.yaml`.

Usually, running with no additional arguments will be just fine.

For a full list of arguments, you can refer to [Shadowsocks libev - Usage](https://github.com/shadowsocks/shadowsocks-libev#usage) and the man page of `simple-obfs`.