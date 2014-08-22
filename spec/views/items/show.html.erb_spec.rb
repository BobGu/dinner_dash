require 'rails_helper'

RSpec.describe 'items/show', :type => :view do
	before(:each) do
		@item = assign(:item, Item.create!(
			:title => "Baltimore Bomb",
      :description => "Yay",
      :price_pie => 30.00
			))
	end
end
