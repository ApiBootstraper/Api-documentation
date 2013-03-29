# [Api-documentation](http://apibootstraper.github.com/apps/api-documentation) [![Dependency Status](https://gemnasium.com/ApiBootstraper/Api-documentation.png)](https://gemnasium.com/ApiBootstraper/Api-documentation) [![Code Climate](https://codeclimate.com/github/ApiBootstraper/Api-documentation.png)](https://codeclimate.com/github/ApiBootstraper/Api-documentation)

A simple Rails application to manage an Api documentation like CMS.

It use some gems :

- [acviteadmin](http://activeadmin.info/), a Ruby on Rails plugin for generating administration style interfaces.


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


## License

ApiBootstraper Api-documentation is released under the [MIT License](http://www.opensource.org/licenses/MIT).
