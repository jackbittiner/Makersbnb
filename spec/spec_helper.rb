ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/app'

require_relative './helpers/session'
require_relative './helpers/listings'

require './app/models/space'
require './app/models/user'
require './app/models/request'

Capybara.app = MakersBnB

RSpec.configure do |config|

  config.include SessionHelpers
  config.include ListingHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do # <-- before entire test run
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do # <-- create a "save point" before each test
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
  end

  config.after(:each) do # <-- after each individual test roll back to "save point"
    DatabaseCleaner.clean
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
