# README

## Development Environment Requirements
- docker-compose

## Local Environment First Time Setup:

### Initialize App
- `docker-compose run --no-deps web rails new . --force --database=postgresql`
### Create db:
- `docker-compose run web rake db:create`
### Run migrations:
- `docker-compose run web rake db:migrate`

- Start App:
- `docker-compose up`

- Stop App
- `docker-compose down`

## Run Test Suite
- `docker-compose run -e "RAILS_ENV=test" web bundle exec rspec`
