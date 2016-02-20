#!/bin/bash

if [ -z "$MAILCHIMP_API_KEY" ]; then
	echo "Using default for MAILCHIMP_API_KEY"
  export MAILCHIMP_API_KEY=dummykeygoeshere
fi

if [ -z "$MYSQL_DB_PASSWORD" ]; then
	echo "Using default for MYSQL_DB_PASSWORD"
  export MYSQL_DB_PASSWORD=1234qwer
fi

if [ -z "$MYSQL_DB_HOST" ]; then
	echo "Using default for MYSQL_DB_HOST"
  export MYSQL_DB_HOST=127.0.0.1
fi

if [ -z "$STORE_NAME" ]; then
	echo "Using default for STORE_NAME"
  export STORE_NAME=store
fi

if [ -z "$MODE" ]; then
	echo "Using default for MODE"
  export MODE=development
fi

if [ -z "$DOCKER_USER" ]; then
	echo "Using default for DOCKER_USER"
  export DOCKER_USER=app
fi

if [ -z "$STORE_APP_ROOT" ]; then
	echo "Using default for STORE_APP_ROOT"
  export STORE_APP_ROOT=store
fi

if [ -z "$APP_PORT" ]; then
	echo "Using default for APP_PORT"
  export APP_PORT=8080
fi

if [ -z "$APP_PORT" ]; then
	echo "Running in bootstrap mode"
  export BOOTSTRAP=true
fi

if [ "$BOOTSTRAP" = "true" ]; then

  RAILS_ENV={{ mode }} bundle exec rake db:drop
  RAILS_ENV={{ mode }} bundle exec rake db:create
  RAILS_ENV={{ mode }} bundle exec rake db:migrate
  RAILS_ENV={{ mode }} bundle exec rake assets:precompile

else

  RAILS_ENV={{ mode }} bundle exec rake db:migrate
  RAILS_ENV={{ mode }} bundle exec rake assets:precompile

fi

cd /home/$DOCKER_USER/$STORE_APP_ROOT && RAILS_ENV=$MODE bundle exec unicorn -p $APP_PORT -c config/unicorn.rb
