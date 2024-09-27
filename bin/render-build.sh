#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

# Restore the MySQL database from backup
mysql -u root -p$MYSQL_PASSWORD  emoreco_app_development < path/to/backup.sql