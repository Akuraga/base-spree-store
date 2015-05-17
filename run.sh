#!/bin/bash

# Specify your mailchimp account api key
export MAILCHIMP_API_KEY={{ mailchimp_api_key }}

# Specify your mysql host and password
export MYSQL_DB_PASSWORD={{ db_password }}
export MYSQL_DB_HOST={{ db_host }}

# Specify your store name
export STORE_NAME={{ store_container_name }}

# Define your mode i.e. development, test, production. Specify unicorn port
RAILS_ENV={{ mode }} bundle exec unicorn -p {{ store_app_port }} -c config/unicorn.rb
