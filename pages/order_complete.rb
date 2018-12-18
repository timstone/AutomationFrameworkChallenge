require_relative 'base_page'

class OrderComplete < BasePage
 
  ORDER_CONFIRMATION = { id: 'order-confirmation'}

  def initialize(driver)
    super
  end

  def order_complete_present?
  	wait_for(10) { is_displayed? ORDER_CONFIRMATION}
  end  

end