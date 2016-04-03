source 'https://rubygems.org'

gem 'dotenv-rails'
gem 'rails', '~> 4.2.6'

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
gem 'friendly_id'
gem 'bcrypt', '~> 3.1.7'
gem 'builder' # RSS Feed
gem 'carrierwave' # Image upload
gem 'remotipart', '~> 1.2' # Allows asynch upload of files aka "multipart"
gem 'mini_magick' # Image manipulation interface with ImageMagick
gem 'jbuilder', '~> 2.0'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'sqlite3'

  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rails_best_practices'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

group :production do
  gem 'mysql2'
end

