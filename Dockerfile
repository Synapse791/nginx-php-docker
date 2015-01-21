FROM ubuntu:14.04

MAINTAINER Synapse <Synapse791@gmail.com>

RUN apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:nginx/stable && \
	apt-get update && \
	apt-get install -y \
		nginx \
		php5-fpm \
		php5-mysql \
		php5-json \
		php5-curl

ADD files/nginx.conf /etc/nginx/nginx.conf
ADD files/nginx-site /etc/nginx/sites-available/default
ADD files/start-server /usr/local/bin/start-server

RUN rm -Rf /usr/share/nginx/html/* && \
	sed -i 's,^listen = /var/run/php5-fpm.sock,listen = 127.0.0.1:9000,g' /etc/php5/fpm/pool.d/www.conf

CMD ["/usr/local/bin/start-server"]
