# Rubyのバージョンを指定。
FROM ruby:2.5.7

RUN apt-get update && apt-get install -y \
    build-essential \
    default-mysql-client \
    nodejs

WORKDIR /Hareyaka
COPY Gemfile Gemfile.lock /Hareyaka/

ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler
RUN bundle install