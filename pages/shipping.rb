require_relative 'base_page'

class Shipping < BasePage

  ACCEPT				    = { id: 'cgv'}
  PROCESS_CARRIER		= { css: 'button[name=processCarrier]'}

  def initialize(driver)
    super
  end

  def add_shipping
  	click ACCEPT
    click PROCESS_CARRIER
  end

  def process_shipping_present?
  	wait_for(10) { is_displayed? PROCESS_CARRIER}
  end  

end