# APP

Aplicação para listagem de cursos, ofertas, universidades e seus campi.

Requisitos:

* Ruby version: 2.7.0

* Configuration

```shell script
git clone git@github.com:the-krg/quero-api-test.git

cd appQ

bundle install

rails db:create db:migrate db:seed

rails s
````

* Database creation:
`
rails db:create
`

* Database initialization: `rails db:migrate`

* How to run the test suite: `rspec` or `bundle exec rspec`

* Usage:
This is an API-only application, so you can only make HTTP requests to it. Try GETting to 
www.localhost:3000/offers, for example.
