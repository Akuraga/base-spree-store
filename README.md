# Base Store

[![Build
Status](https://travis-ci.org/lorcanoeire/base-spree-store.svg)](https://travis-ci.org/lorcanoeire/base-spree-store)

A base spree store (3-stable) with mailchimp integration

#### Store name

```
It is required for configuration purposes that a store name is set. See
the run.sh script or set the STORE_NAME environment variable
i.e. export STORE_NAME=base-store-spree
```

### Configure database.yml

```
Set the environment variables:
export MYSQL_DB_PASSWORD=1234qwer
export MYSQL_DB_HOST=127.0.0.1
See run.sh script
```

### Configure Spree Chimpy

```
Set an environment variable to resolves the configuration: config.key = ENV['MAILCHIMP_API_KEY']
This is set in config/initializers/spree_chimpy.rb
```

### Install dependancies

```
bundle update
```

### Create Database
```
bundle exec rake db:create
```

### Run Migrations & Create admin user

```
bundle exec rake db:migrate
bundle exec rake spree_auth:admin:create
```

### Seed data & Load samples
(skip this step if you want to run a clean installation)

```
bundle exec rake db:seed
bundle exec rake spree_sample:load
```

### Start

```
If all environment variables are set run
bundle exec unicorn -p 8080 -c config/unicorn.rb

Alternatively modify the run.sh script and run
./run.sh
```

### View

```
open http://127.0.0.1:8080/shop
```

### QuickStart

```
export MYSQL_DB_PASSWORD=1234qwer
export MYSQL_DB_HOST=127.0.0.1
export MAILCHIMP_API_KEY=X

RAILS_ENV=production bundle exec unicorn -p 8080 -c config/unicorn.rb

or

./go start:development

```

### DotEnv

Using dotenv to load all required environment variables from a local user .env file, this is .gitignore'd
```
ln -s ~/.spreeenv/.env .env

```
