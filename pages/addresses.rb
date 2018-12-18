require_relative 'base_page'

class Addresses < BasePage

  PROCESS_ADDRESS 		= { css: 'button[name=processAddress]'}

  def initialize(driver)
    super
  end

  def process_address
  @driver.find_element(PROCESS_ADDRESS).click
  end

  def process_address_present?
  	wait_for(10) { is_displayed? PROCESS_ADDRESS}
  end  

end