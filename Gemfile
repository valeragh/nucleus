git_source(:github) { |name| "https://github.com/#{name}.git" }
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '0.20'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'therubyracer', platforms: :ruby
gem "font-awesome-rails"
gem 'haml-rails'
gem 'bootstrap', '~> 4.0.0'
gem 'metamagic'
gem 'friendly_id', '~> 5.0.0'
gem 'babosa'
gem 'carrierwave'
gem 'carrierwave-i18n'
gem 'mini_magick'
gem 'simple_form'
gem 'jquery-form-validator-rails'
gem 'geocoder'
gem 'gmaps4rails'
gem 'devise'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'activeadmin_addons'
gem 'cancancan'
gem "roo", "~> 2.7.0"
gem 'sucker_punch'
gem 'ransack'
gem 'liqpay', '~>1.0.0'
gem 'figaro'

group :test, :development do
  gem "rspec-rails", "~> 3.6"
  gem "factory_girl_rails", "~> 4.4.1"
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'byebug'
end

group :test do
  gem "capybara", "~> 2.4.3"
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'web-console', '~> 2.0'
  gem 'annotate'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

group :production do
  gem 'capistrano', github: 'capistrano/capistrano', ref: '96a16'
  gem 'unicorn'
end