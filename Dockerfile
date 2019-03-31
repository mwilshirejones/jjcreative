FROM ruby:2.4-stretch

# TODO: Sift through this, probabaly don't need them all, e.g. sqlite as using pg.
RUN apt-get update -qq && apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev apt-transport-https

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Node.js + Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn
# Create temp node_modules folder so host directory doens't 
# override/remove while mounting. The docker-entrypoint.sh
# script will then copy the temporary node modules into the
# the app directory after volume is mounted.
RUN mkdir /temp
COPY package.json yarn.* /temp/
WORKDIR /temp
RUN yarn install

WORKDIR /app
COPY . /app

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
