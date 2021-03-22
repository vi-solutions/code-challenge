# README

## Code Challenge App
* Application Framework: Ruby on Rails
* Database: Postgres
* Ruby v2.5.5
* CI/CD: Github Actions
* Rails v6.1.3
* Postgres v13.2
* Docker
* Test Suite: RSpec
* Linter: Rubocop
* Test Coverage: SimpleCov


## Development Environment Requirements
- docker-compose

## Local Environment Setup:

- Build App
`docker-compose build`

- Boot the App
`docker-compose up`

- Once PostgreSQL has initialized, open another terminal and run migrations:
`docker-compose run web rake db:migrate`

- App should now be available on `localhost:3000`

### How to Stop App

- Stop App
`docker-compose down`

## Run Test Suite
- `docker-compose run -e "RAILS_ENV=test" web bundle exec rspec`


## Administrators
To retrieve number of successful requests to the opengis api:
In rails console run `HealthServicesControllerSpec.all.count`\
OR\
Run the query `SELECT COUNT(*) FROM "health_services_api_requests"`


## CI/CD

### Github Actions
- Currently running rspec and rubocop