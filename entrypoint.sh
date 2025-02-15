#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

echo "Starting Jekyll build"

####################################################
# Set workspace permissions
####################################################

chmod -R a+w /github/workspace

####################################################
# Build the Jekyll site
####################################################

gem install bundler
gem update bundler
bundle install --without development --jobs 4 --retry 3
bundle exec jekyll build --trace

####################################################
# Build completed
####################################################

echo "Completed Jekll build"
