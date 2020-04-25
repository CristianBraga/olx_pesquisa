Bundler.require :default
Bundler.require :lib
require 'selenium-webdriver'

RSpec.configure do |rspec_config|
    rspec_config.include PageObject::PageFactory

    rspec_config.before(:context) do
      Selenium::WebDriver::Chrome.driver_path="/usr/bin/chromedriver"
      @browser = Selenium::WebDriver.for :chrome

      @driver = @browser

      @browser.manage.timeouts.implicit_wait = 20

      @browser.manage.timeouts.page_load = 60

      @browser.manage.window.maximize
    end

    rspec_config.after(:context) do
      @browser.quit
    end
end
