FROM ruby:2.7

WORKDIR /app
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]