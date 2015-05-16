# Base Store

A base spree store (2-4-stable) with some mailchimp integrations and the spree fancy
theme applied.

###Configure database.yml

```
See config/database.yml.sample for an example
```

###Configure Spree Chimpy

```
Add your mailchimp API key to config/initializers/spree_chimpy.rb
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
bundle exec rake spree_auth:admin:create
```

###Seed data & Load samples
(skip this step if you want to run a clean installation)

```
bundle exec rake db:seed
bundle exec rake spree_sample:load
```

###Start

```
bundle exec unicorn -p 8080 -c config/unicorn.rb
```

###View

```
open http://127.0.0.1:8080/shop
```
