require 'selenium-webdriver'

RSpec.configure do |config|

  config.before(:each) do
    case ENV['browser']
    when 'firefox'
      geckodriver = File.join(Dir.pwd, 'drivers', 'geckodriver')
      @driver = Selenium::WebDriver.for :firefox, driver_path: geckodriver
    when 'chrome'
      chromedriver = File.join(Dir.pwd, 'drivers', 'chromedriver')
      @driver = Selenium::WebDriver.for :chrome, driver_path: chromedriver
    end
  end

  config.after(:each) do
    @driver.quit
  end

end
