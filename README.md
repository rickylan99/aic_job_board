# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Docker Instructions

https://medium.com/@guillaumeocculy/setting-up-rails-6-with-postgresql-webpack-on-docker-a51c1044f0e4

https://docs.docker.com/compose/rails/

To apply changes to the gemfile and build the code once pulled from github. It is in the section "Rebuild the application"

Other helpful functions:
docker-compose run --rm web bundle exec rake db:create
docker-compose run --rm web bundle exec rake db:migrate
docker-compose run --rm web bundle exec rake db:seed