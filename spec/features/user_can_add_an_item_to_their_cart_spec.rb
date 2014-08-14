require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
	before(:each) do
		Item.create(title: 'Key Lime', description: "yum", price_slice: 5, price_pie: 34)
		visit items_path
	end
	it 'can add one item to their cart' do
		# this should add Key Lime pie to cart
		page.click_link('Key Lime')
		# Go to the cart
		visit carts_path
		# We expect the cart page to have Key Lime in the content
		expect(page).to have_content('Key Lime')
	end
end