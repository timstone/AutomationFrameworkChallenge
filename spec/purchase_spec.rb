require_relative 'spec_helper'
require_relative '../pages/home'
require_relative '../pages/product'
require_relative '../pages/order'
require_relative '../pages/authentication'
require_relative '../pages/account'

describe 'Online Shop' do

  before(:each) do
    @home = Home.new(@driver)
    @product = Product.new(@driver)
    @order = Order.new(@driver)
    @authentication = Authentication.new(@driver)
    @account = Account.new(@driver)
  end

  it 'can buy a dress from the home page' do
    
    @home.view_item
    
    expect(@product.add_to_cart_present?).to eql true

    @product.add_to_cart

    expect(@product.proceed_to_checkout_present?).to eql true
    # Dialog box
    @product.proceed_to_checkout

    expect(@order.proceed_to_checkout_present?).to eql true
    # Summary
    @order.proceed_to_checkout

    # Create account
    expect(@authentication.create_account_present?).to eql true

    @authentication.create_account

    # Account page
    expect(@account.account_form_present?).to eql true
    @account.enter_account_details

    # Address
    expect(@home.submit_form_present?).to eql true
    @driver.find_element(css: 'button[name=processAddress]').click
    # Shipping
    expect(@home.submit_form_present?).to eql true
    @driver.find_element(id: 'cgv').click
    @driver.find_element(css: 'button[name=processCarrier]').click
    # Payment
    expect(@home.payment_option_present?).to eql true

    @driver.find_element(css: '.payment_module > .bankwire').click

    expect(@home.confirm_order_present?).to eq true
    @driver.find_element(css: '#cart_navigation button').click

    expect(@home.order_complete?).to eql true

  end

end

