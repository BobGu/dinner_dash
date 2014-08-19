require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the order view', type: :feature do

		let(:order1) do
			Order.create(
				user_id: 1156,
				order_total: 135.00,
				order_type: "Pickup",
				delivery_address: "1510 Blake",
				order_status: "paid"
				)
			end

		let(:order2) do
			Order.create(
				user_id: 1156,
				order_total: 135.00,
				order_type: "Pickup",
				delivery_address: "1510 Blake",
				order_status: "ordered"
				)

		  end

	describe 'order status' do
		before(:each) do
      order1
			order2
		end

    it "view orders by paid status" do
			visit orders_path
			click_on("Paid")
			expect(page).to have_content("paid")
			expect(page).not_to have_content("ordered")
		end
	end
end
