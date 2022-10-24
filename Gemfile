source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

gem 'sprockets-rails'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'redis'

gem 'bootsnap', require: false

# Basics
gem 'faraday'

gem 'pg'

gem 'rdoc'

gem 'sidekiq'

gem 'pagy'

gem 'rack-cors'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rubocop'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec'
  gem 'vcr'
  gem 'webmock'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
  gem 'guard-rspec', require: false
  gem 'database_cleaner'
end
