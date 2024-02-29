ARG CADDY_VERSION=2.7.6
ARG BUILD_TIME

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/godaddy \
    --with github.com/caddyserver/replace-response \
    --with github.com/zhangjiayin/caddy-geoip2 \
    --with github.com/circa10a/caddy-geofence \
    --with github.com/neodyme-labs/influx_log \
    --with github.com/gonevo/caddy-tls-file-manager \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/hairyhenderson/caddy-teapot-module@v0.0.3-0

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
