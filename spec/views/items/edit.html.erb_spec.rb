require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
	before(:each) do
		@item = assign(:item, Item.create!(
			:title 			 => 	"Pie Title",
			:description => 	"Pie Description",
			:price_slice => 	5.00,
			:price_pie 	 => 	20.00
			))
	end

	it "renders the edit item form" do 
		pending
		
		render

		assert_select "form[action=?][method=?]", item_path(@item), "post" do
			assert_select "input#item_title[name=?]", "item[title]"
			assert_select "input#item_description[name=?]", "item[description]"
			assert_select "input#item_price_slice[name=?]", "item[price_slice]"
			assert_select "input#item_price_pie[name=?]", "item[price_pie]"
		end
		
	end
end