require 'rails_helper'

RSpec.describe Cart, :type => :model do
  let(:cart) do
  	Cart.create
  end

  it 'can have items' do
  	cart.items.create(id: 140, title: 'Key Lime', description: 'Yum', price_slice: 4.00, price_pie: 28.00)
  	cart.items.create(id: 125, title: 'Apple', description: 'Yum', price_slice: 4.00, price_pie: 28.00)
  	results = cart.items
    expect(results.count).to eq(2)
  end
end
