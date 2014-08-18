require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do

	let(:order) do
		Order.create(
			user_id: 1156,
			order_total: 135.00,
			order_type: "Pickup",
			delivery_address: "1510 Blake",
			order_status: "Unpaid"
			)
	end

	describe 'splash page' do
		it 'has splash page content' do
			visit '/'

			expect(page).to have_content("pie bitches")
		end
	end
end
