require_relative 'base_page'

class Home < BasePage

  ITEM            		= { css: "#homefeatured .product-name[title='Faded Short Sleeve T-shirts']"  }

  PROCESS_ADDRESS 		= { css: 'button[name=processAddress]'}
  SUBMIT_FORM	  		= { css: 'button[type=submit]'}
  CONFIRM_ORDER   		= { css: '#cart_navigation button'}
  ORDER_CONFIRMATION 	= { id: 'order-confirmation'}
  BANKWIRE				= { css: '.payment_module > .bankwire'}

  attr_reader :driver

  def initialize(driver)
    super
    visit '/'
  end

  def view_item
  	@driver.find_element(ITEM).click
  end

  def process_address_present?
  	wait_for(10) { is_displayed? PROCESS_ADDRESS}
  end

  def submit_form_present?
  	wait_for(10) { is_displayed? SUBMIT_FORM}
  end

  def payment_option_present?
  	wait_for(20) { is_displayed? BANKWIRE}
  end

  def confirm_order_present?
  	wait_for(10) { is_displayed? CONFIRM_ORDER}
  end

  def order_complete?
  	wait_for(10) { is_displayed? ORDER_CONFIRMATION}
  end

end
