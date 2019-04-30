FROM alpine:latest

RUN apk add snapcast-server && \
    mkdir -p /var/lib/snapserver/soundshare

EXPOSE 1704

ENTRYPOINT ["/usr/bin/snapserver"]
