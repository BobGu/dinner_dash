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
		render
		assert_select "form[action=?][method=?]", items_path, "post" do 
			assert_select "input#item_title[title=?]", "item[title]"
			assert_select "input#item_description[description=?]", "item[description]"
			assert_select "input#item_price_slice[price_slice=?]", "item[price_slice]"
			assert_select "input#item_price_pie[price_pie=?]", "item[price_pie]"
		end
	end
end