require_relative 'spec_helper'
require_relative '../pages/home'
require_relative '../pages/product'
require_relative '../pages/order'
require_relative '../pages/authentication'
require_relative '../pages/account'
require_relative '../pages/addresses'
require_relative '../pages/shipping'
require_relative '../pages/payment'
require_relative '../pages/confirm_order'
require_relative '../pages/order_complete'


describe 'Online Shop' do

  before(:each) do
    @home = Home.new(@driver)
    @product = Product.new(@driver)
    @order = Order.new(@driver)
    @authentication = Authentication.new(@driver)
    @account = Account.new(@driver)
    @addresses = Addresses.new(@driver)
    @shipping = Shipping.new(@driver)
    @payment = Payment.new(@driver)
    @confirm_order = ConfirmOrder.new(@driver)
    @order_complete = OrderComplete.new(@driver)
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
    expect(@addresses.process_address_present?).to eql true
    @addresses.process_address
    # Shipping
    expect(@shipping.process_shipping_present?).to eql true
    @shipping.add_shipping
    # Payment
    expect(@payment.payment_option_present?).to eql true
    @payment.choose_bank_wire
    expect(@confirm_order.confirm_order_present?).to eq true
    @confirm_order.submit
    expect(@order_complete.order_complete_present?).to eql true
  end

end

