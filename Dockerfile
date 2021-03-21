FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /code-challenge
COPY Gemfile /code-challenge/Gemfile
COPY Gemfile.lock /code-challenge/Gemfile.lock
RUN bundle install
COPY . /code-challenge


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]