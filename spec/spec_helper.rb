ENV["RAILS_ENV"] ||= 'test'

def configure
  #Not sure where this is going to go
  #require 'rubygems'
  #require 'spork'
  #uncomment the following line to use spork with the debugger
  #require 'spork/ext/ruby-debug'

  require File.expand_path('../../config/environment', __FILE__) 
  require 'rspec/rails'
  require 'rspec/autorun'
  require "capybara/rspec"
  require 'database_cleaner'
  require "shoulda-matchers"

  DatabaseCleaner.strategy = :truncation

  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  require File.expand_path("../../config/environment", __FILE__)
  include Capybara::DSL


  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end
end


if defined?(Spork)
  Spork.prefork { configure } 
  Spork.each_run { DatabaseCleaner.clean }
else
  configure
end
