require_relative 'base_page'

class Addresses < BasePage

  PROCESS_ADDRESS 		= { css: 'button[name=processAddress]'}

  def initialize(driver)
    super
  end

  def process_address
  click PROCESS_ADDRESS
  end

  def process_address_present?
  	wait_for(10) { is_displayed? PROCESS_ADDRESS}
  end  

end