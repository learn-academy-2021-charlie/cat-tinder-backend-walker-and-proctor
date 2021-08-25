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


# API Back End Setup

`$ rails db:create  `
`$ bundle add rspec-rails  `
`$ rails g rspec:install  `
`$ rails s  `
- check to make sure app is working 
`$ rails g resource Cat name:string age:integer enjoys:text `
`$ rails db:migrate `
`$ rspec spec `
- check to make sure rspec is working  
 
 ## Seeds
db/seeds.rb 

 ```ruby
 cats = [...]

 cats.each do |attributes|
    Cat.create attributes
    puts "creating cat #{attributes}"
end
```
`$ rails db:seed`

## troubleshooting

`$ rails db:drop `
`$ rails db:create `
`$ rails db:migrate `
`$ rails db:seed `


## API CORS

app/controllers/application_controller.rb 

```ruby
    skip_before_action :verify_authenticity_token
```
cat_tinder_backend/Gemfile
`gem 'rack-cors', :require => 'rack/cors'`

### create cors.rb file
config/initializers/cors.rb

```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
`$ bundle install`