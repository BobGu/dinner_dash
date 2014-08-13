require 'rails_helper'

RSpec.describe 'items/show', :type => :view do 
	before(:each) do 
		@item = assign(:item, Item.create!(
			:title => "Baltimore Bomb",
      :description => "Yay",
      :price_slice => 6.50,
      :price_pie => 30.00
			))
	end	

	it 'renders attributes' do 
		render 
		assert_select ".pie_title", :text => "Baltimore Bomb"
		assert_select ".pie_description", :text => "Yay"
	end
end