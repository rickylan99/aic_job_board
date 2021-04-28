# README

# Getting Started

1. Clone respository
    * `git clone`
2. Start and build Docker container
    * `docker-compose up --build`
3. Run database migrations 
    * `docker-compose run --rm web rails db:migrate`
    * `docker-compose run --rm web rails db:seed`
4. Create .env files (See Below)
5. Start Docker and begin development
    * `docker-compose up`

------
# Env Files
* Create two files, `cloudinary.env` and `gmail.env`
* cloudinary.env:
~~~~
CLOUDINARY_URL="Place Cloudinary URL from Cloudinary.com Dashboard"
~~~~
* gmail.env:
~~~~
GMAIL_ADDRESS="Place sending gmail address"
GMAIL_PASSWORD="Place sending gmail password"
ADMIN_ADDRESS="Place recieving email for admin notifications"
~~~~
------

# Executing Commands in Docker

## Running Tests
```
docker-compose run --rm -e RAILS_ENV=test web rails spec:system
```

## Opening SimpleCov

1. After running test suite(s) navigate to the `coverage` folder
2. Open `index.html` via a browser

## Running Brakeman

```
docker-compose run --rm web brakeman
```

## Open Bash Shell 

```
docker-compose run --rm web /bin/sh
```

## Docker Tips

To apply changes to the gemfile and build the code once pulled from github run:
~~~~
docker-compose up --build
~~~~
------

# CI/CD
- CI is run through Github Actions
  - Files are located in `.github/workflows`
  - Two tests are Brakeman and RSpec
- CD must be setup through a Heroku Pipline
  - Create a pipeline in Heroku and link the Github Repository

------

# Deploying to Heroku

- Deploy application to Heroku with basic Rails instructions:
  - https://devcenter.heroku.com/articles/getting-started-with-rails6

Steps:
1. Navigate to the Settings tab and click `Reveal Config Vars`. Add the following:
~~~~
ADMIN_ADDRESS - Address that recieves admin emails
GMAIL_ADDRESS - Sending gmail address
GMAIL_PASSWORD - Sending gmail password
CLOUDINARY_URL - Cloudinary API key, found on cloundinary.com
HEROKU_URL - url of heroku app for sending emails (aicaccess.herokuapp.com)
~~~~
2. Click `More` in the top right corner on the app page. Press `Run console`
  - type `rails db:migrate` and press enter
  - type `rails db:seed` and press enter
3. Go to the Resources tab  and search for the add-on `Heroku Scheduler`
  - Add to your app and click it
  - Press create job
  - Choose `Every day at` and select 5:00AM UTC (12:00AM CST)
  - In the command box enter `rake update_expired_jobs`
  - Save Job
4. Enjoy deployed application





