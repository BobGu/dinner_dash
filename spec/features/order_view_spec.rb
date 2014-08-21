require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the order view', type: :feature do

	context 'with orders of different statuses' do
		before(:each) do

			Order::Status::ALL.each do |status|
				Order.create(
					user_id: 1156,
					order_total: 135.00,
					order_type: "Pickup",
					delivery_address: "1510 Blake",
					order_status: status
				)
			end
		end

		Order::Status::ALL.each do |status|
			it "views orders by #{status} status" do
				visit orders_path
				click_on(status.capitalize)
				expect(page).to have_content(status.downcase)
				expect(page).not_to have_content(Order::Status::ALL.reject {|s| s == status })
			end
		end
	end

	context 'of user updating statuses' do
		it "changes 'ordered' status to cancelled" do
			# go to the orders page
			# click on some random order with an 'ordered' status
			#
	  end
	end
end
