#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

# Restore the MySQL database from backup
# 環境変数を使用してpsqlコマンドを実行
psql -h $DB_HOST -U $DB_USER -d $DB_NAME -f backup.sql