#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <APP_NAME>"
  exit 1
fi

APP_NAME=$1

# New installation guide
echo "Installing necessary packages..."
sudo apt-get -y install ruby-full libsqlite3-dev libyaml-dev

echo "Checking Ruby version..."
ruby -v

echo "Checking SQLite3 version..."
sqlite3 --version

echo "Installing Rails..."
sudo gem install rails

echo "Checking Rails version..."
rails --version

echo "Changing ownership of gems directory..."
sudo chown -R $USER:$USER /var/lib/gems/3.0.0/gems/

echo "Installing Bundler..."
sudo gem install bundler

echo "Cleaning up gems..."
gem cleanup

echo "Updating gems..."
sudo gem update

echo "Creating new Rails application: $APP_NAME..."
rails new $APP_NAME

echo "Starting the Rails server for $APP_NAME..."
cd $APP_NAME
bin/rails server

