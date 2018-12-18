require_relative 'base_page'

class Order < BasePage

  PROCEED		  		= { css: ".cart_navigation > a[title='Proceed to checkout']"}
  ADD					= { css: "cart_quantity_up"}

  attr_reader :driver

  def initialize(driver)
    super
  end

  def proceed_to_checkout
  	@driver.find_element(PROCEED).click
  end

  def proceed_to_checkout_present?
  	wait_for(30) { is_displayed? PROCEED }
  end

 end