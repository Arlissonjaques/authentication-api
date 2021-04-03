source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails'
  # Simple one-liner tests for common Rails functionality.
  # Read more: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
  # Better error page. Read more: https://github.com/BetterErrors/better_errors
  gem 'better_errors'
  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  # Read more: https://github.com/rubocop/rubocop
  gem 'rubocop', require: false
  # Code coverage for Ruby with a powerful configuration library and automatic merging of
  # coverage across test suites. Read more: https://github.com/simplecov-ruby/simplecov
  gem 'simplecov', require: false
  # A Ruby code quality reporter.
  # Read more: https://github.com/whitesmith/rubycritic
  gem 'rubycritic', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise_token_auth'
gem 'pundit'
# ActiveRecord plugin allowing you to hide and restore records without actually deleting them.
# Read more: https://github.com/ActsAsParanoid/acts_as_paranoid
gem 'acts_as_paranoid'
# A library for setting up Ruby objects as test data.
# Read more: https://github.com/thoughtbot/factory_bot_rails
gem 'factory_bot_rails'
# A library for generating fake data such as names.
# Read more: https://github.com/faker-ruby/faker
gem 'faker'
# customize json output
# Read more: https://github.com/rails-api/active_model_serializers
gem 'active_model_serializers'