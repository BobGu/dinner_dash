require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the order view', type: :feature do

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

	context 'with orders of different statuses' do
		Order::Status::ALL.each do |status|
			it "views orders by #{status} status" do
				visit orders_path
				click_on(status.capitalize)
				expect(page).to have_content(status.downcase)
				expect(page).not_to have_content(Order::Status::ALL.reject {|s| s == status })
			end
		end
	end

	context 'of admin updating statuses' do
		
		it "changes 'ordered' status to cancelled" do
			order = Order.create!(
								user_id: 1156,
								order_total: 135.00,
								order_type: "Pickup",
								delivery_address: "1510 Blake Street",
								order_status: "ordered"
							)
			# go to the orders index page
			visit orders_path
			# click on some random order with an 'ordered' status
			click_link(order.id)
			# In the show page, click on cancel for that specific order
			click_on("Cancel Order")
			# Expect the order's status to now be 'cancelled'
			expect(page).to have_text("cancelled")
			expect(page).not_to have_text("ordered")
	  end

		it "changes 'paid' status to 'cancelled'" do
			order = Order.create!(
								user_id: 1156,
								order_total: 135.00,
								order_type: "Pickup",
								delivery_address: "1510 Blake Street",
								order_status: "paid"
							)
			visit orders_path
			click_link(order.id)
			click_on("Cancel Order")
			expect(page).to have_text("cancelled")
			expect(page).not_to have_text("paid")
		end

		it "changes 'ordered' status to 'mark as paid'" do
			order = Order.create!(
								user_id: 1156,
								order_total: 135.00,
								order_type: "Pickup",
								delivery_address: "1510 Blake Street",
								order_status: "ordered"
							)
			visit orders_path
			click_link(order.id)
			click_on("Mark As Paid")
			expect(page).to have_text("paid")
			expect(page).not_to have_text("ordered")
		end

		it "changes 'paid' status to 'completed'" do
			order = Order.create!(
								user_id: 1156,
								order_total: 135.00,
								order_type: "Pickup",
								delivery_address: "1510 Blake Street",
								order_status: "paid"
							)
			visit orders_path
			click_link(order.id)
			click_on("Mark As Completed")
			expect(page).to have_text("completed")
			expect(page).not_to have_text("paid")
		end
	end
end
