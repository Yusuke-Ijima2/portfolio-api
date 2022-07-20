FROM ruby:2.7

ENV RAILS_ENV=production

WORKDIR /app
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]