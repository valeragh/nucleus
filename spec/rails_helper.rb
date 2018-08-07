ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require_relative 'support/controller_macros'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.extend ControllerMacros, :type => :controller

  config.use_transactional_fixtures = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
end
