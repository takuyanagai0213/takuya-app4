FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y default-mysql-client \
    locales locales-all && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
# RUN apt-get install -y nodejs npm && npm install n -g && n 10.13.0
COPY . /fishingshares
ENV LANG="ja_JP.UTF-8" \
    TZ="Asia/Tokyo" \
    APP_HOME="/fishingshares"
WORKDIR $APP_HOME
RUN gem install bundler:1.17.3
RUN bundle install

ADD . $APP_HOME
CMD ["./entrypoint.sh"]
