FROM alpine:latest
LABEL MAINTAINER="yilu-zzb"

COPY nginx.service /etc/service/nginx/run
COPY consul-template.service /etc/service/consul-template/run
COPY nginx.conf.ctmpl /etc/consul-templates/nginx.conf.ctmpl

RUN apk --update --no-cache add nginx curl runit \
 && wget -qO- https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.tgz | tar -zx -C /usr/local/bin/ \
 && chmod a+x /etc/service/nginx/run /etc/service/consul-template/run \
 && rm -v /etc/nginx/conf.d/* \
 && mkdir -p /run/nginx/

CMD ["runsvdir", "/etc/service"]