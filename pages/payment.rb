require_relative 'base_page'

class Payment < BasePage

  BANKWIRE	= { css: '.payment_module > .bankwire'}

  def initialize(driver)
    super
  end

  def choose_bank_wire
  	@driver.find_element(BANKWIRE).click
  end

  def payment_option_present?
  	wait_for(10) { is_displayed? BANKWIRE}
  end  

end