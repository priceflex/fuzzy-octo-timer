source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
gem 'annotate', '~> 2.4.1.beta'
gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form'

group :development do
  gem 'rails3-generators' # for factory_girl_rails and simple_form
  gem 'puma'
end

group :test, :development do
  gem "rspec-rails"
  gem 'rspec-instafail'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem "capybara"
  gem 'guard-spork'
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-migrate"
  gem "shoulda-matchers"
end
group :production do
  gem "pg"
end
