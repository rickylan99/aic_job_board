release: DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake db:migrate:reset
web: bundle exec puma -t 5:5 -p ${PORT:-3000}