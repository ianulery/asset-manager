source 'https://rubygems.org'
ruby '3.2.2'

gem 'rails', '~> 7.0.0'
gem 'devise'
gem 'jquery-rails'
gem 'sass-rails'
gem 'concurrent-ruby', '1.3.4'
gem 'sprockets-rails'

group :production do
  gem 'pg'
  gem 'puma'
end

group :development do
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'sqlite3', '~> 1.0'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'faker'
  gem 'rails-controller-testing'
end
