FROM alpine:3 AS final

RUN apk add -q --no-progress wireguard-tools

ENTRYPOINT  ["/bin/sh", "-c", "wg-quick up wg0; tail -f /dev/null"]