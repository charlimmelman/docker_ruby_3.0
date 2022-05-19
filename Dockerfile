FROM ruby:3.0-alpine AS builder

RUN apk add build-base

FROM ruby:3.0-alpine

RUN apk update && \
  apk add --no-cache \
  gcompat \
  bash \
  build-base \
  nodejs \
  postgresql-dev \
  postgresql-client \
  tzdata \
  imagemagick \
  less \
  yarn

RUN echo "gem: --no-document" > ~/.gemrc && \
  gem install sassc nokogiri pg puma bundler

# BUILD INSTRUCTIONS
# ---New Way---
# docker buildx build --push --tag charlimmelman/ruby_3.0 --platform=linux/arm64,linux/amd64 .
#--- Old Way---
# docker build -t charlimmelman/ruby_3.0 .
# docker push charlimmelman/ruby_3.0