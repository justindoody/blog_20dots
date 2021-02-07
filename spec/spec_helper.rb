require 'factory_bot_rails'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  Capybara.server = :webrick

  Capybara.register_driver :chrome_headless do |app|
    options = ::Selenium::WebDriver::Chrome::Options.new
    driver_path = ENV['CHROMEDRIVER_PATH']

    raise 'CHROMEDRIVER_PATH is required for running JS specs but is undefined in ENV' unless driver_path

    service = Selenium::WebDriver::Service.new(path: driver_path, port: 9005)

    options.add_argument('--headless')
    options.add_argument('--no-sandbox')

    Capybara::Selenium::Driver.new(app, browser: :chrome, service: service, options: options)
  end

  Capybara.javascript_driver = :chrome_headless

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
