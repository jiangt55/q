FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD start.sh /science.sh
RUN chmod +x /science.sh

CMD /start.sh
