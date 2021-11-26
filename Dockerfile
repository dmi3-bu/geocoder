FROM ruby:2.7.3-alpine

RUN apk add --no-cache \
  build-base \
  tzdata

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem update bundler && \
  bundle config set without 'development test' && \
  bundle install --jobs 4

COPY . .

EXPOSE 9294

CMD ["bin/puma"]