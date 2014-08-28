require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the admin order view', type: :feature do

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

		end
	end

	context 'of admin updating statuses' do



	end
end
