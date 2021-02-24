FROM ruby:2.7.2-alpine3.13

ARG APP_PATH=/code
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

RUN apk add --update --no-cache \
        bash \
        nano \
        build-base \
        nodejs \
        sqlite-dev \
        tzdata \
        imagemagick \
        postgresql-dev \
        chromium-chromedriver \
        chromium && \
      gem install bundler -v 2.2.8 && \
      mkdir $APP_PATH

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/

RUN bundle install --jobs 4

COPY . $APP_PATH/

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]