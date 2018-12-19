require_relative 'base_page'

class Home < BasePage

  ITEM = { css: "#homefeatured .product-name[title='Faded Short Sleeve T-shirts']"  }
  
  def initialize(driver)
    super
    visit '/'
  end

  def view_item
  	click ITEM
  end

end
