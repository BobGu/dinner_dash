require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the order_items view', type: :feature do

    let(:order) do
      Order.create(
        user_id: 1156,
        order_total: 135.00,
        order_type: "Pickup",
        delivery_address: "1510 Blake",
        order_status: "Unpaid"
        )
    end

    let(:item) do

    end

    describe 'order items' do
      before(:each) do
        Item.create(
          title: 'Key Lime',
          description: 'yummy',
          price_pie: 30.00
        )
        visit items_path(order_id: order.id)
      end

      it 'has a new page with items' do
        expect(page).to have_content(Item.first.title)
      end
    end
  end
