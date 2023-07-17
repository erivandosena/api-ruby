FROM phusion/passenger-full:2.2.0

RUN apt-get update && apt-get install -y \
    libpq-dev libnginx-mod-http-passenger=1:6.0.18-1~focal1 \
    && rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/sites-enabled/default
RUN rm -f /etc/service/nginx/down
RUN rm -f /etc/service/redis/down

ADD config/nginx.conf /etc/nginx/sites-enabled/api-crud.conf

RUN mkdir -p /var/run/passenger-instreg

USER app

ARG VERSION
ARG COMMIT_SHA
ENV APP_VERSION=$VERSION
ENV COMMIT_SHA=$COMMIT_SHA
ENV NODE_MODULES_CACHE true
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV BUNDLE_WITHOUT="development test"
ENV API_HOME /home/app/api-crud
ENV API_KEY_HMAC_SECRET_KEY $(echo 'YzVlYjI3NmM5Mzk0ZDYyMDUwZWI2N2MyM2ZhZTQyM2I2MzQ3OTFmY2JlYzI4ZWRiYzhhZDI4YjVhNmYyN2M5Mwo=' | base64 -d)

ENV RAILS_MAX_THREADS 5

RUN mkdir -p ${API_HOME}

WORKDIR ${API_HOME}

COPY --chown=app:app Gemfile Gemfile.lock ./

RUN bundle install --jobs $(nproc) --retry 3

COPY --chown=app:app . .

RUN rm -f config/credentials.yml.enc
RUN EDITOR="echo" bin/rails credentials:edit
RUN SECRET_KEY_BASE=$(bundle exec rake secret)
# RUN bundle exec rake db:create \
#     && bundle exec rake db:migrate

USER root

EXPOSE 80

LABEL org.opencontainers.image.title="Official Passenger image" \
    org.opencontainers.image.description="API RESTful com Ruby on Rails" \
    org.opencontainers.image.url="https://hub.docker.com/r/erivando/api-ruby" \
    org.opencontainers.image.source="https://github.com/erivandosena/api-ruby" \
    org.opencontainers.image.version=$APP_VERSION \
    org.opencontainers.image.revision=$COMMIT_SHA \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.maintainer="Erivando Sena<erivandosena@gmail.com>"

# CMD ["/sbin/my_init"]