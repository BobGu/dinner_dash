require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
	before(:each) do
		Item.create(title: 'Key Lime', description: "yum", price_slice: 5, price_pie: 34)
		visit items_path
	end
	it 'can add one item to their cart' do
		page.click_link('Key Lime')
		visit('cart')
		expect(page).to have_content('Key Lime')
	end
end