require_relative 'base_page'

class ConfirmOrder < BasePage

  CONFIRM_ORDER   		= { css: '#cart_navigation button'}

  def initialize(driver)
    super
  end

  def submit
  	@driver.find_element(CONFIRM_ORDER).click
  end

  def confirm_order_present?
  	wait_for(10) { is_displayed? CONFIRM_ORDER}
  end  

end