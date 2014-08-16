require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the order view', type: :feature do

		let(:order) do
			Order.create(
				user_id: 1156,
				order_total: 135.00,
				order_type: "Pickup",
				delivery_address: "1510 Blake",
				order_status: "Unpaid"
				)
		end

	describe 'items' do
		before(:each) do
			order.items.create(title: "Baltimore Bomb")
			order.items.create(title: "Key Lime")
			visit order_path(order)
		end
	
		it 'shows the items' do
			order.items.each do |item|
				expect(page).to have_content(item.title)
			end
		end
	end
end
