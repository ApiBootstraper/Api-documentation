# Api-documentation

A simple Rails application to manage an Api documentation.

## Installation

- install rvm
- git clone
- cp Api-documentation/
- bundle install --without development test postgresql sqlite
- RAILS_ENV=production rake db:setup
- run server (rack, passenger, ...)

## Update

- cp Api-documentation/
- git fetch origin
- git pull ???
- bundle install --without development test postgresql sqlite
- RAILS_ENV=production rake db:migrate
- touch tmp/restart.txt
