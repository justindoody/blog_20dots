source 'https://rubygems.org'

gem 'dotenv-rails', '~> 2.7'
gem 'rails', '~> 5.2.0'
gem 'puma', '~> 5.0'
gem 'envied', '~> 0.9'

### Assets
gem 'webpacker'
gem 'sass-rails', '~> 5.0.6'
gem 'sprockets', '~> 3.0'
gem 'uglifier', '~> 4.0'
gem 'coffee-rails', '~> 4.1'
gem 'jquery-rails', '~> 4.4'
gem 'turbolinks', '~> 5.2.0'
gem 'haml', '~> 5.2'
gem 'autoprefixer-rails'
gem 'pure-css-rails'
gem 'bootsnap', require: false

### General
gem 'friendly_id'
gem 'bcrypt', '~> 3.1.7'
gem 'builder' # RSS Feed
gem 'carrierwave', '~> 1.3' # Image upload
gem 'remotipart', '~> 1.4' # Allows async upload of files aka "multipart"
gem 'mini_magick' # Image manipulation interface with ImageMagick

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'pry-rails', '~> 0.3'
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 6.0'
  gem 'rails_best_practices'
end

group :test do
  gem 'rails-controller-testing'
  gem 'capybara', '~> 3.2'
  gem 'capybara-screenshot'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'database_cleaner', '~> 2.0'
  gem 'selenium-webdriver', '~> 3.142'
end

group :production do
  gem 'pg', '~> 1.2.3'
end

