source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'haml-rails'
gem 'redis-rails', '~> 5'
gem 'devise'
gem 'omniauth'

gem 'decent_exposure'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'will_paginate', '~> 3.1.0'
gem 'factory_girl_rails'
gem 'faker'

group :development, :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

group :development do
  gem 'foreman'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
