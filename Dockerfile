FROM ruby:2.4
MAINTAINER a0s

ARG PORT=8888

ENV RAILS_ENV production
ENV LANG C.UTF-8
ENV TERM xterm-256color
ENV PORT ${PORT}

RUN apt-get update && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y bash wget nodejs debian-keyring yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir -p /app \
    && mkdir -p /app/tmp/pids

RUN wget https://download.docker.com/linux/static/edge/x86_64/docker-17.11.0-ce.tgz \
    && tar xzvf docker-17.11.0-ce.tgz \
    && cp docker/* /usr/bin/

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install --deployment --without test development

COPY . /app
RUN rails assets:precompile RAILS_ENV=assets

EXPOSE ${PORT}
#ENTRYPOINT ["bundle", "exec", "rackup", "--server", "thin", "--host", "0.0.0.0", "--port", "${PORT}"]
