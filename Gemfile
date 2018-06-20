source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Look up state, city info using zip Code
gem 'zip-codes'

# Heroku prefers the ruby version to be specified
ruby '~> 2.3.1'

# fog for interacting and hosting on amazon s3
gem 'fog'

# Enviroment gem
gem 'envyable'

# Mailer stuff
gem 'mail_form'

# Forms made easy for Rails!
gem 'simple_form'

# Bootstrap, yeah!
gem 'bootstrap', '~> 4.0.0'

# jquery-Rails
gem 'jquery-rails'

# Pick a date gem
gem 'pickadate-rails'

# omniauth for omniauth
gem 'omniauth'

# paperclip for image uploads (might not be used)
gem 'paperclip', '~> 5.2.1'

# carrierwave for carrierwave stuff
gem 'carrierwave', '~> 1.0'

# mini_magick for mini_magick stuff
gem 'mini_magick'

# stripe for stripe stuff
gem 'stripe'

# Devise for user authentication
gem 'devise'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use sqlite3 as the database for Active Record in Development Mode
# Otherwise use postgres
# group :development, :test do
#   gem 'sqlite3'
# end
#
# group :production do
#   gem 'pg'
# end
gem 'pg'

# Heroku gem
gem 'rails_12factor'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# For development enviroment. Might not be necessary in Production.
gem 'listen', '>= 3.0.5'

# ** UNUSED **
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'sendgrid-ruby'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'foreman'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
