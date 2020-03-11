FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y vim nodejs default-mysql-client
COPY . /fishingshares
ENV APP_HOME /fishingshares
WORKDIR $APP_HOME
RUN bundle install
ADD . $APP_HOME
