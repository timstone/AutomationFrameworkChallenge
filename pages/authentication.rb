require_relative 'base_page'

class Authentication < BasePage

  EMAIL			  		= { id: 'email_create'}
  CREATE_ACCOUNT		= { id: 'create-account_form'}
  CREATE 				= { id: 'SubmitCreate'}

  attr_reader :driver

  def initialize(driver)
    super
  end

  def create_account
  	@email_address = "test" + rand(100_000_000).to_s + "@mailinator.com"
    @driver.find_element(EMAIL).send_keys @email_address
    @driver.find_element(CREATE).click
  end

  def create_account_present?
  	wait_for(10) { is_displayed? CREATE_ACCOUNT }
  end

 end