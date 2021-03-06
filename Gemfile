source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Generate beautiful API documentation, including a UI to explore and test operations, directly from your rspec integration tests.
gem 'rswag', '~> 2.0', '>= 2.0.5'
#Database Cleaner is a set of strategies for cleaning your database in Ruby.
gem 'database_cleaner', '~> 1.7'
#Factory_bot is a fixtures replacement with a straightforward definition syntax
gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
#Faker gem is a port of Perl's Data::Faker library that generates fake data.
gem 'faker', '~> 1.9', '>= 1.9.1'
# Pg is the Ruby interface to the PostgreSQL RDBMS.
gem 'pg', '~> 1.1', '>= 1.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem "rspec-rails", "~> 3.8"

group :development, :test do
  gem "shoulda-matchers", "~> 3.1"
  gem "capybara", "~> 3.5", ">= 3.5.1"
  gem "simplecov", "~> 0.16.1", require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "guard", "~> 2.14", ">= 2.14.2"
  gem "guard-rspec", "~> 4.7", ">= 4.7.3"
  gem "guard-cucumber", "~> 2.1", ">= 2.1.2"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
