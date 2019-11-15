FROM alpine:latest

ARG PCS_VERSION='3.6.8'
ENV GID 65534
ENV UID 65534

RUN apk --no-cache add shadow && adduser -D www-data \
    && wget -O pcs.zip https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${PCS_VERSION}/BaiduPCS-Go-${PCS_VERSION}-linux-amd64.zip \
    && unzip pcs.zip && rm pcs.zip && mv BaiduPCS-Go-${PCS_VERSION}-linux-amd64/BaiduPCS-Go .. && rm BaiduPCS-Go-${PCS_VERSION}-linux-amd64 -rf

COPY aux-files/entry.sh /entry.sh
RUN chmod +x /entry.sh

VOLUME ["/home/www-data/Downloads"]

EXPOSE 5299

ENTRYPOINT ["/entry.sh"]
