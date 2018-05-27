require 'bundler/setup'
require 'capybara'
require 'selenium-webdriver'
require 'pry'

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

Capybara.default_max_wait_time = 10

def start_scraping(url, &block)
  Capybara::Session.new(:selenium).tap { |session|
    session.visit url
    session.instance_eval(&block)
  }
end

##  1: find(:xpath, '//*[@id="menu-logged-out"]/ul/li[3]/a').click
##  2: p title
##  3: fill_in 'user_email', with: '*********'
##  4: fill_in 'user_password', with: '*********'
##  5: save_and_open_screenshot
##  6: find(:xpath, '//*[@id="new_user"]/div[2]/input').click
##  7: save_and_open_screenshot
##  8: find(:xpath, '//*[@id="enterprise-navigation-bar"]/div[1]/div[1]/div/div/li[5]/a/div/div[2]').click
##  9: save_and_open_screenshot
## 10: find(:xpath, '//*[@id="enterprise-navigation-bar"]/div[1]/div[1]/div/div/li[5]/a/div/div[2]').click
## 11: save_and_open_screenshot
## 12: find(:xpath, '/html/body/div[10]/div/div[5]/a[1]').click
## 13: save_and_open_screenshot
## 14: find(:xpath, '//*[@id="main-inner"]/div[2]/div/div/div/div[2]/div[3]/div[1]/ul/li[2]/span').click
## 15: save_and_open_screenshot
## 16: pp body


start_scraping 'https://www.wantedly.com/enterprise/tickets' do
  binding.pry
  p title
  save_and_open_screenshot
end
