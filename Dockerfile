FROM debian:jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx-full \
						curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& mv /etc/nginx /etc/nginx-source

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./init-env.sh /init-env.sh
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux \
	&& chmod +x /usr/local/bin/ep /init-env.sh

ONBUILD COPY . /etc/nginx-source

EXPOSE 80

CMD ["/init-env.sh"]
