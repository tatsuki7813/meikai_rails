FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY src/Gemfile /myapp/Gemfile
COPY src/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY src /myapp

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000
CMD [ "bin/rails", "server", "-b", "0.0.0.0" ]