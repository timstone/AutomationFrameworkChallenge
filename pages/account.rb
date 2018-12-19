require_relative 'base_page'

class Account < BasePage

  MALE		  				    = { id: 'id_gender1'}
  FIRST_NAME				    = { id: 'customer_firstname'}
  LAST_NAME 				    = { id: 'customer_lastname'}
  PASSWORD 					    = { id: 'passwd'}
  DOB_DAY 					    = { id: 'days'}
  DOB_MONTH					    = { id: 'months'}
  DOB_YEAR					    = { id: 'years'}
  POSTAL_FIRST_NAME			= { id: 'customer_firstname'}
  POSTAL_LAST_NAME 			= { id: 'customer_lastname'}
  ADDRESS_LINE_ONE 			= { id: 'address1'}
  CITY 						      = { id: 'city'}
  STATE 					      = { id: 'id_state'}
  POSTCODE 					    = { id: 'postcode'}
  MOBILE_PHONE_NO 			= { id: 'phone_mobile'}
  SUBMIT 					      = { id: 'submitAccount'}

  attr_reader :driver

  def initialize(driver)
    super
  end

  def enter_account_details
  	click MALE
   
  	type "Bob", FIRST_NAME
    type "Smith", LAST_NAME
    # TODO change to env var
    type "password", PASSWORD
       # Create account section
    select_list_value DOB_DAY, '8'
    select_list_value DOB_MONTH, '8'
    select_list_value DOB_YEAR, '2000'
    type "Bob", POSTAL_FIRST_NAME
    type "Smith", POSTAL_LAST_NAME
    type "1 test lane", ADDRESS_LINE_ONE
    type "Testville", CITY
    select_list_value STATE, '2'
    type "90210", POSTCODE
    type "07900 123456", MOBILE_PHONE_NO
    click SUBMIT
  end

  def account_form_present?
  	wait_for(10) { is_displayed? SUBMIT  }
  end

 end



     