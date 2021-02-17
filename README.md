# README

# Getting Started

1. Clone respository
    * `git clone`
2. Start and build Docker container
    * `docker-compose up --build`
3. Run database migrations 
    * `docker-compose run --rm web rails db:migrate`
4. Start Docker and begin development
    * `docker-compose up`

# Docker Instructions

https://medium.com/@guillaumeocculy/setting-up-rails-6-with-postgresql-webpack-on-docker-a51c1044f0e4

# Running Tests

```
docker-compose run --rm -e RAILS_ENV=test web rails spec:system
```
