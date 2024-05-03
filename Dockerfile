FROM ruby:3.3.1-bullseye

ENV LANG C.UTF-8

WORKDIR /app

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
	&& tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		default-mysql-client \
		libxml2 \
		libxml2-dev \
		libxslt1-dev \
		dumb-init \
	&& rm -rf /var/lib/apt/lists/*

ENV RUBYOPT '-W:deprecated'
ENV BUNDLE_APP_CONFIG /app/.bundle
ENV BUNDLE_PATH /app/vendor/bundle
