#!/bin/bash

if [ -z "$MAILCHIMP_API_KEY" ]; then
	echo "Using default for MAILCHIMP_API_KEY"
  #DUMMY KEY
  export MAILCHIMP_API_KEY=2ccd3a737e0232723af024235799c848c5-us10
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
else
	echo "Using $STORE_NAME for STORE_NAME"
fi

if [ -z "$MODE" ]; then
	echo "Using default for MODE"
  export MODE=development
else
	echo "Running application in $MODE mode..."
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

if [ -z "$BOOTSTRAP" ]; then
	echo "Will now run in bootstrap mode..."
  export BOOTSTRAP=true
fi

if [ -z "$ADMIN_EMAIL" ]; then
	echo "Using the default admin email credentials as none are specified"
  export ADMIN_EMAIL=spree@example.com
fi

if [ -z "$ADMIN_PASSWORD" ]; then
	echo "Using the default admin email credentials as none are specified"
  export ADMIN_PASSWORD=1234qwer
fi

if [ "$BOOTSTRAP" == "True" ]; then
  echo "Running bootstrap tasks..."
  echo "Dropping old database..."
  RAILS_ENV=$MODE bundle exec rake db:drop
  echo "Creating new database..."
  RAILS_ENV=$MODE bundle exec rake db:create
  echo "Running migrations..."
  RAILS_ENV=$MODE bundle exec rake db:migrate
	echo "Installing the Admin user..."
	AUTO_ACCEPT=true ADMIN_EMAIL=$ADMIN_EMAIL ADMIN_PASSWORD=$ADMIN_PASSWORD RAILS_ENV=$MODE bundle exec rake spree_auth:admin:create
  echo "Compiling assets"
  RAILS_ENV=$MODE bundle exec rake assets:precompile

else
  echo "Established instance, skipping bootstrap tasks..."
  echo "Running migrations..."
  RAILS_ENV="$MODE" bundle exec rake db:migrate
  echo "Compiling assets"
  RAILS_ENV="$MODE" bundle exec rake assets:precompile

fi

echo "Starting application..."
cd /home/$DOCKER_USER/$STORE_APP_ROOT && RAILS_ENV=$MODE bundle exec unicorn -p $APP_PORT -c config/unicorn.rb
