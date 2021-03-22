# README

## Code Challenge App
* Main application: Ruby on Rails
* Database: Postgres
* Ruby v2.5.5
* Rails v6.1.3
* Postgres v13.2
* Docker
* Test Suite: RSpec
* Linter: Rubocop


## Development Environment Requirements
- docker-compose

## Local Environment Setup:

### Initialize/Start App
- `docker-compose up`

### Run migrations:
If you haven't run initial migrations or there are pending migrations run:
- `docker-compose run web rake db:migrate`


- Stop App
- `docker-compose down`

## Run Test Suite
- `docker-compose run -e "RAILS_ENV=test" web bundle exec rspec`


## Administrators
To retrieve number of successful requests to the opengis api:
In rails console run `HealthServicesControllerSpec.all.count`\
OR\
Run the query `SELECT COUNT(*) FROM "health_services_api_requests"`