#!/usr/bin/env bash

gem source --add https://rubygems.org/
gem list | grep bundler > /dev/null || gem install bundler --user-install --no-rdoc --no-ri --version "1.10.6"
~/bin/bundle check > /dev/null || ~/bin/bundle install --path=vendor

~/bin/bundle exec rake -f Rakefile $@
