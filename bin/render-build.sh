#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
curl --create-dirs -o $HOME/.postgresql/root.crt -O https://cockroachlabs.cloud/cluster/5fa57cc4-dabc-42d4-a7f1-2f749cad8d0c/cert
bundle exec rake db:migrate
