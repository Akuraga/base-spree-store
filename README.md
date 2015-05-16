# Base Store

A base spree store (2-4-stable) with some mailchimp integrations and the spree fancy
theme applied.

###Configure database.yml

```
See config/database.yml.sample for an example
```

###Install dependancies

```
bundle update
```

###Create Database
```
bundle exec rake db:create
```

###Run Migrations & Create admin user

```
bundle exec rake db:migrate
bundle exec rails g spree:auth:install
```

###Seed data & Load samples
(skip this step if you want to ru a clean installation)

```
bundle exec rake db:seed
bundle exec rake spree_sample:load
```


