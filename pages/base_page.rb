class BasePage

  def initialize(driver)
    @driver = driver
  end

  def visit(url_path)
  @driver.get ENV['base_url'] + url_path
  end

  def find(locator)
    @driver.find_element locator
  end

  def type(text, locator)
    find(locator).send_keys text
  end

  def click(locator)
    find(locator).click
  end

  def is_displayed?(locator)
    begin
      find(locator).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end

  def wait_for(seconds = 15)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

  def select_list_value(locator, value)
    dropdown = find(locator)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:value, value)
  end

end
