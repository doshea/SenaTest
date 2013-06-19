source 'https://rubygems.org'

gem 'rails'
gem 'pg'
gem 'jquery-rails'
gem 'haml'
gem 'bcrypt-ruby'

#Used in seeding the members of Congress
gem 'httparty'
gem 'json'

#Used to get members' images
require 'nokogiri'
require 'open-uri'

gem 'carrierwave'
gem 'rmagick'
gem 'fog'
gem 'remotipart'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'zurb-foundation'
  gem 'foundation-icons-sass-rails'
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  # gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
end

group :development, :test do

  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'

  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-stack_explorer'

  gem 'annotate'

  gem 'quiet_assets'
  gem 'binding_of_caller'
  gem 'meta_request'

  gem 'coffee-rails-source-maps'
end

group :development do
  gem 'better_errors' #May cause issues in rspec, separated from the test group
end
