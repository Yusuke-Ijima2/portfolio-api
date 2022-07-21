FROM ruby:2.7

WORKDIR /app
RUN apt-get update -qq \
  && apt-get install -y nodejs default-mysql-client
COPY ./src /app
RUN bundle config --local set path 'vender/bundle' \
  && bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]