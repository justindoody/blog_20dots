source 'https://rubygems.org'

gem 'rails', '4.2'
gem 'sass-rails', '~> 5.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'haml'
gem 'friendly_id'

# Used for creating the RSS Feed
gem 'builder'

# Image upload
gem 'carrierwave'

# Image manipulation gem to interface with ImageMagick
gem 'mini_magick'

# Allows asychronous upload of files aka "multipart"
gem 'remotipart', '~> 1.2'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara'
  gem 'rails_best_practices'
end

group :test do
  gem 'guard-rspec'
  gem 'database_cleaner'
end

group :production do
  gem 'mysql2'
end

