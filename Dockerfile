FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /docker-rails
WORKDIR /docker-rails


ADD Gemfile /docker-rails/Gemfile
ADD Gemfile.lock /docker-rails/Gemfile.lock

RUN bundle install

ADD . /docker-rails

#ARG URL=0.0.0.0:4000

#CMD ["runserver $URL"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]