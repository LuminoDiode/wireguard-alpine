# wireguard-alpine
[![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=for-the-badge&logo=alpine-linux&logoColor=white)](https://www.alpinelinux.org)
[![Wireguard](https://img.shields.io/badge/wireguard-%2388171A.svg?style=for-the-badge&logo=wireguard&logoColor=white)](https://www.wireguard.com)
### Literally an Alpine with WG preinstalled.
    FROM alpine:3 AS final
    RUN apk add -q --no-progress wireguard-tools
    ENTRYPOINT  ["/bin/sh", "-c", "wg-quick up wg0; tail -f /dev/null"]

## Usage:
### 1. Use compose template provided below.
### 2. Pass your wg0.conf to the container. 
### 3. There you go!
    version: '3.4'
      services:
        personal_wg_server:
          restart: always
          image: luminodiode/wireguard:alpine
          cap_add:
            - NET_ADMIN
          ports:
            - 51820:51820/udp 
          volumes:
            - ./wg0.conf:/etc/wireguard/wg0.conf:ro
            - ./publickey:/etc/wireguard/publickey:ro
            - ./privatekey:/etc/wireguard/privatekey:ro
