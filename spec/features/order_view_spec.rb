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

    it "view orders by status" do
			#seeing all the orders
			visit orders_path
			#click on "paid", status
			click_on("Paid")
			#see a new page
			visit paid_path
			#seeing all the orders with a "paid" status
			expect(page).to have_content("paid")
			expect(page).to not_have("ordered")
		end
	end
end
