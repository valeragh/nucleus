git_source(:github) { |name| "https://github.com/#{name}.git" }
source 'https://rubygems.org'

gem 'rails', '4.2.10'
gem 'pg', '0.20'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
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
gem 'jquery-inputmask-rails'
gem 'geocoder'
gem 'gmaps4rails'
gem 'devise'
gem 'activeadmin', '~>1.3.0'
gem 'activeadmin_addons'
gem 'activeadmin_trumbowyg'
gem 'cancancan'
gem "roo", "~> 2.7.0"
gem 'sucker_punch'
gem 'ransack'
gem 'liqpay', '~>1.0.0'
gem 'figaro'
gem 'enumerize'
gem "dynamic_sitemaps"
gem 'dalli'
gem 'rack-mini-profiler'

group :test, :development do
  gem "rspec-rails", "~> 3.6"
  gem "factory_girl_rails", "~> 4.4.1"
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'byebug'
end

group :test do
  gem "capybara", "~> 2.4.3"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
  gem "database_cleaner", "~> 1.3.0"
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