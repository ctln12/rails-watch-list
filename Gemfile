# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'tailwindcss-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# HTTP/REST API client library [https://lostisland.github.io/faraday/]
gem 'faraday'

# Optimize, transform, upload and manage cloud's assets [https://github.com/cloudinary/cloudinary_gem]
gem 'cloudinary'

# Rails forms made easy [https://github.com/heartcombo/simple_form]
gem 'simple_form'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Patch-level verification for bundler [https://github.com/rubysec/bundler-audit]
  gem 'bundler-audit'
  # Checks for Ruby and gems known security vulnerabilities [https://github.com/civisanalytics/ruby_audit]
  gem 'ruby_audit'
  # Checks for security vulnerabilities [https://github.com/presidentbeef/brakeman]
  gem 'brakeman'

  # Analyses and formats code following Ruby Style Guide [https://github.com/rubocop/rubocop]
  gem 'rubocop', require: false
  # Enforces Rails best practices and coding conventions [https://github.com/rubocop/rubocop-rails]
  gem 'rubocop-rails', require: false
  # Analyses specs [https://github.com/rubocop/rubocop-rspec]
  gem 'rubocop-rspec', require: false
  # Custom rubocop cops used by Discourse [https://github.com/discourse/rubocop-discourse]
  gem 'rubocop-discourse'

  # Testing framework [https://github.com/rspec/rspec-rails]
  gem 'rspec-rails'
  # Creates fixtures [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails'
  # Simulates a real user interaction to test web applications [https://github.com/teamcapybara/capybara]
  gem 'capybara'
  # Generates fake data
  gem 'faker'
  # Provides one-liners to test common Rails functionality [https://github.com/thoughtbot/shoulda-matchers]
  gem 'shoulda-matchers'
  # Mimics the behaviour of a real user interaction [https://rubygems.org/gems/selenium-webdriver/versions/4.1.0]
  gem 'selenium-webdriver'
  # Run Selenium tests more easily [https://github.com/titusfortner/webdrivers]
  gem 'webdrivers'

  # Shim to load environment variables from .env into ENV [https://github.com/bkeepers/dotenv]
  gem 'dotenv-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
