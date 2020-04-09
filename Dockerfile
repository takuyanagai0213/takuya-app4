FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y vim nodejs default-mysql-client \
    locales locales-all && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8
COPY . /fishingshares
ENV LANG="ja_JP.UTF-8" \
    TZ="Asia/Tokyo" \
    APP_HOME="/fishingshares"
WORKDIR $APP_HOME
RUN bundle install
ADD . $APP_HOME
