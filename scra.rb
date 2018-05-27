require 'bundler/setup'
require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: %w(headless disable-gpu window-size=1280,800),
      },
    )
  )
end
Capybara.javascript_driver = :selenium

def start_scraping(url, &block)
  Capybara::Session.new(:selenium).tap { |session|
    session.visit url
    session.instance_eval(&block)
  }
end
