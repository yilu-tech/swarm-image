FROM yilutech/cloud9:ubuntu

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
 && apt-get install -y nginx \
 && rm -rf /etc/nginx/sites-* \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["/startup"]