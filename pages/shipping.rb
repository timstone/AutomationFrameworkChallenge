require_relative 'base_page'

class Shipping < BasePage

  ACCEPT				    = { id: 'cgv'}
  PROCESS_CARRIER		= { css: 'button[name=processCarrier]'}

  def initialize(driver)
    super
  end

  def add_shipping
  	@driver.find_element(ACCEPT).click
    @driver.find_element(PROCESS_CARRIER).click
  end

  def process_shipping_present?
  	wait_for(10) { is_displayed? PROCESS_CARRIER}
  end  

end