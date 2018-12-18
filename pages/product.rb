require_relative 'base_page'

class Product < BasePage

  QUANTITY     	  		= { id: 'quantity_wanted' }
  ADD_TO_CART	  		= { id: 'add_to_cart' }
  PROCEED_TO_CHECKOUT 	= { css: '#layer_cart a[title="Proceed to checkout"]'}

  attr_reader :driver

  def initialize(driver)
    super
  end

  def add_to_cart
  @driver.find_element(ADD_TO_CART).click
  end

  def add_to_cart_present?
	wait_for(10) { is_displayed? ADD_TO_CART }
  end

  def proceed_to_checkout_present?
  	wait_for(10) { is_displayed? PROCEED_TO_CHECKOUT}
  end

  def proceed_to_checkout
  	@driver.execute_script("$('.button-medium span').trigger('click');")
  end
  

end
