FROM yilutech/cloud9

COPY git.sh /

# install php
RUN set -x \
 && addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data \
 && echo "https://mirrors.aliyun.com/alpine/v3.7/main" > /etc/apk/repositories && echo "https://mirrors.aliyun.com/alpine/v3.7/community" >> /etc/apk/repositories \
 && apk add --no-cache php7 \
                       php7-bcmath \
                       php7-ctype \
                       php7-curl \
                       php7-dom \
                       php7-fileinfo\
                       php7-fpm \
                       php7-ftp \
                       php7-gd \
                       php7-gmp \
                       php7-iconv \
                       php7-json \ 
                       php7-mbstring \
                       php7-mcrypt \
                       php7-openssl \
                       php7-pdo_mysql \
                       php7-pdo_sqlite \
                       php7-phar \
                       php7-session \
                       php7-simplexml \
                       php7-sqlite3 \
                       php7-tokenizer \
                       php7-xml \
                       php7-xmlreader \
                       php7-xmlwriter \
                       php7-zip \
                       libbsd \
                       openssl \
                       openssh-client \
 && wget https://dl.laravel-china.org/composer.phar -O /usr/local/bin/composer \
 && chmod a+x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://packagist.laravel-china.org \
 && chmod +x /git.sh

CMD ["/startup"]