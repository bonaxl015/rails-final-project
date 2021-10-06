# Hi there 👋

<!-- This README would normally document whatever steps are necessary to get the
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

* ... -->

Visit this [link](#paste-heroku-link-here) to view it on heroku

_Check out our [ERD](https://drive.google.com/file/d/1T2OLmTJ3vEdbJ6g5pw2MIbsT9DWg3WZP/view?usp=sharing) to know how our models were architectured!_ 😎

Note: Kindly check "[db/seeds.rb](https://github.com/bonaxl015/rails-final-project/blob/master/db/seeds.rb)" for initial data to assist you in exploring around the app.

## Ruby Version

Ruby 2.7.3

## System Dependencies

- Rails 6.1.4
- NodeJS 12.22.1
- Yarn 1.22.10
- PostgreSQL 13.3

## Configuration

```shell
bundle install
yarn install --check-files
bundle exec rails webpacker:install
```

## Database Creation

```shell
rails db:create
```

## Database Initialization

```shell
rails db:migrate
rails db:seed

or

rails db:setup (skip "rails db:create")
```

## Deployment Instructions

```shell
heroku login
git push heroku main
heroku run rails db:migrate
heroku run rails db:seed
```
