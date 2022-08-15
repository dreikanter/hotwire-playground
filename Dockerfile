FROM ruby:3

RUN apt-get update --yes \
  && apt-get install --yes --no-install-recommends \
    apt-utils \
    build-essential \
  && gem install bundler:'~> 2.3' \
  && rm -rf /var/lib/apt/lists/*

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

ARG RAILS_ENV
ARG DATABASE_URL

ENV RAILS_ENV=$RAILS_ENV
ENV RACK_ENV=$RAILS_ENV
ENV DATABASE_URL=$DATABASE_URL

WORKDIR /app
