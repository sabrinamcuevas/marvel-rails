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

group :development, :test do
  gem 'dotenv-rails'
  gem 'rubocop'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec'
end
