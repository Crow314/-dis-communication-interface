FROM ruby:2.7.5-alpine
ENV LANG C.UTF-8

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

RUN apk --update --no-cache add \
      alpine-sdk \
      libxml2-dev \
      libxslt-dev \
      postgresql-client \
      postgresql-dev \
      nodejs \
      yarn \
      tzdata \
      less \
      libidn-dev

COPY ../../Gemfile $APP_HOME/
COPY ../../Gemfile.lock $APP_HOME/

RUN bundle install

COPY ../../ $APP_HOME

EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0
