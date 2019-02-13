FROM shadowsocks/shadowsocks-libev:v3.2.3

LABEL maintainer="boris <boris1993@126.com>" \
      shadowsocks-libev="https://github.com/shadowsocks/shadowsocks-libev" \
      v2ray-plugin="https://github.com/shadowsocks/v2ray-plugin"

ENV HOST        mydomain.me

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 1080
ENV PASSWORD    password
ENV METHOD      chacha20-ietf-poly1305
ENV OBFS_PLUGIN v2ray-plugin
ENV OBFS_OPTS   server
ENV ARGS=

USER root

RUN set -ex \
 && apk add --no-cache --virtual .build-deps tar \
 && wget -cq -O /root/v2ray-plugin.tar.gz https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.0/v2ray-plugin-linux-amd64-8cea1a3.tar.gz \
 && tar xvzf /root/v2ray-plugin.tar.gz -C /root \
 && mv /root/v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin \
 && rm -f /root/v2ray-plugin.tar.gz \
 && apk del .build-deps

USER nobody

CMD exec ss-server \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k $PASSWORD \
      -m $METHOD \
      --fast-open \
      -u \
      --plugin $OBFS_PLUGIN \
      --plugin-opts $OBFS_OPTS \
      $ARGS
