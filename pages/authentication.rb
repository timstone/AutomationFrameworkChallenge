require_relative 'base_page'

class Authentication < BasePage

  EMAIL			  		      = { id: 'email_create'}
  CREATE_ACCOUNT_FORM		= { id: 'create-account_form'}
  CREATE 				        = { id: 'SubmitCreate'}

  def initialize(driver)
    super
  end

  def create_account
  	@email_address = "test" + rand(100_000_000).to_s + "@mailinator.com"
    type @email_address, EMAIL
    click CREATE
  end

  def create_account_present?
  	wait_for(10) { is_displayed? CREATE_ACCOUNT_FORM }
  end

 end