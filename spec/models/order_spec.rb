require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) do
    Order.create(user_id: 1, order_total: 100.00, order_type: "Pickup", delivery_address: "1510 Blake Street, Denver, CO 80202", order_status: "Paid")
  end

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is invalid without a user_id' do
    order.user_id = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order total' do
    order.order_total = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order type' do
    order.order_type = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order status' do
    order.order_status = nil
    expect(order).not_to be_valid
  end

  it 'has items' do
    order.items.create(id: 140, title: 'Key Lime', description: 'Yum', price_slice: 4.00, price_pie: 28.00)
    order.items.create(id: 125, title: 'Apple', description: 'Yum', price_slice: 4.00, price_pie: 28.00)
    results = order.items
    expect(results.count).to eq(2)
  end
end
