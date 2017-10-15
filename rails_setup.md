## Some of this needs switching from root to vagrant user (such as installing ruby and rails), not sure how to do that!

```

#! /bin/bash

# First, home directory of user is /home/vagrant...we need to use this because the script is running as root so ~ will not direct us to the desired place...
HOME=/home/vagrant

# Rails setup from: https://gorails.com/setup/ubuntu/14.04

# The first step is to install some dependencies for Ruby...
sudo apt-get update

sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

# Install rbenv and then ruby-build...
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> $HOME/.bashrc
exec $SHELL

rbenv install 2.4.0
rbenv global 2.4.0
ruby -v

# Install Bundler...
gem install bundler
rbenv rehash

# Install node.js...
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Rails
gem install rails -v 5.0.1
rbenv rehash
rails -v

# Set up PostgreSQL
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev

sudo -u postgres createuser admin -s

```