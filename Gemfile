source 'https://rubygems.org'

gem 'dotenv-rails'
gem 'rails', '~> 4.2.11'

### Assets
gem 'sass-rails', '~> 5.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'haml'
gem 'autoprefixer-rails'
gem 'pure-css-rails'

### General
gem 'json', '~> 1.7'
gem 'friendly_id'
gem 'bcrypt', '~> 3.1.7'
gem 'builder' # RSS Feed
gem 'carrierwave' # Image upload
gem 'remotipart', '~> 1.2' # Allows asynch upload of files aka "multipart"
gem 'mini_magick' # Image manipulation interface with ImageMagick
gem 'jbuilder', '~> 2.0'
gem 'bigdecimal', '~> 1.4'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.13'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rails_best_practices'
end

group :test do
  gem 'capybara', '~> 3.2'
  gem 'capybara-screenshot'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'database_cleaner'
  gem 'selenium-webdriver', '~> 3.142'
end

group :production do
  gem 'mysql2'
end

