require 'rails_helper'

RSpec.describe "items/new", :type => :view do
	before(:each) do
		assign(:item, Item.new(
			:title => "Baltimore Bomb",
      :description => "Yay",
      :price_slice => 6.50,
      :price_pie => 30.00
			))
	end

	it "renders new item form" do
		pending
		
		render
<<<<<<< HEAD

		assert_select "form[action=?][method=?]", items_path, "post" do 
=======
		assert_select "form[action=?][method=?]", items_path, "post" do
>>>>>>> admin_orders
			assert_select "input#item_title[name=?]", "item[title]"
			assert_select "input#item_description[name=?]", "item[description]"
			assert_select "input#item_price_slice[name=?]", "item[price_slice]"
			assert_select "input#item_price_pie[name=?]", "item[price_pie]"
		end
	end
end
