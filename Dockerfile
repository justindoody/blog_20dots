FROM ruby:2.5.8-alpine3.13

ARG APP_PATH=/code

RUN apk add --update --no-cache \
        bash \
        build-base \
        nodejs \
        sqlite-dev \
        tzdata \
        mysql-dev \
        chromium-chromedriver \
        chromium && \
      gem install bundler -v 1.17.3 && \
      mkdir $APP_PATH

COPY entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/entrypoint.sh

WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/

RUN bundle install

COPY . $APP_PATH/

ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]