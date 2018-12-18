require_relative 'base_page'

class Account < BasePage

  MALE		  				= { id: 'id_gender1'}
  FIRST_NAME				= { id: 'customer_firstname'}
  LAST_NAME 				= { id: 'customer_lastname'}
  PASSWORD 					= { id: 'passwd'}
  DOB_DAY 					= { id: 'days'}
  DOB_MONTH					= { id: 'months'}
  DOB_YEAR					= { id: 'years'}
  POSTAL_FIRST_NAME			= { id: 'customer_firstname'}
  POSTAL_LAST_NAME 			= { id: 'customer_lastname'}
  ADDRESS_LINE_ONE 			= { id: 'address1'}
  CITY 						= { id: 'city'}
  STATE 					= { id: 'id_state'}
  POSTCODE 					= { id: 'postcode'}
  MOBILE_PHONE_NO 			= { id: 'phone_mobile'}
  SUBMIT 					= { id: 'submitAccount'}

  attr_reader :driver

  def initialize(driver)
    super
  end

  def enter_account_details
  	@driver.find_element(MALE).click
   
  	@driver.find_element(FIRST_NAME).send_keys "Bob"
    @driver.find_element(LAST_NAME ).send_keys "Smith"
    # TODO change to env var
    @driver.find_element(PASSWORD).send_keys "password"
       # Create account section
    dropdown = @driver.find_element(DOB_DAY)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:value, '8')

    dropdown = @driver.find_element(DOB_MONTH)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:value, '8')

    dropdown = @driver.find_element(DOB_YEAR)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:value, '2000')

    @driver.find_element(POSTAL_FIRST_NAME).send_keys "Bob"
    @driver.find_element(POSTAL_LAST_NAME).send_keys "Smith"

    @driver.find_element(ADDRESS_LINE_ONE).send_keys "1 test lane"
    @driver.find_element(CITY).send_keys "Testville"

    dropdown = @driver.find_element(STATE)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:value, '2')

    @driver.find_element(POSTCODE).send_keys "90210"
    @driver.find_element(MOBILE_PHONE_NO).send_keys "07900 123456"

    @driver.find_element(SUBMIT).click

  end

  def account_form_present?
  	wait_for(10) { is_displayed? SUBMIT  }
  end

 end



     