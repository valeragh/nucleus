require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'sucker_punch/testing/inline'

Dir["#{Rails.root}/app/uploaders/*.rb"].each { |file| require file }
if defined?(CarrierWave)
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end 
               
      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end 
    end 
  end 
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.after(:suite) do
    if Rails.env.test? || Rails.env.cucumber?
      FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    end 
  end
end
