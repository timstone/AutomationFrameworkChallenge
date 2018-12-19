require_relative 'base_page'

class ConfirmOrder < BasePage

  CONFIRM_ORDER   		= { css: '#cart_navigation button'}

  def initialize(driver)
    super
  end

  def submit
  	click CONFIRM_ORDER
  end

  def confirm_order_present?
  	wait_for(10) { is_displayed? CONFIRM_ORDER}
  end  

end