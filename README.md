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

# Opening SimpleCov

1. After running test suite(s) navigate to the `coverage` folder
2. Open `index.html` via a browser

# Running Brakeman

```
docker-compose run --rm web brakeman
```

# Open Bash Shell 

```
docker-compose run --rm web /bin/sh
```

https://medium.com/@guillaumeocculy/setting-up-rails-6-with-postgresql-webpack-on-docker-a51c1044f0e4

https://docs.docker.com/compose/rails/

To apply changes to the gemfile and build the code once pulled from github. It is in the section "Rebuild the application"

Other helpful functions:
docker-compose run --rm web bundle exec rake db:create
docker-compose run --rm web bundle exec rake db:migrate
docker-compose run --rm web bundle exec rake db:seed
