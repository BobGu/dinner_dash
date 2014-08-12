require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:item) do
    Item.new(title: 'Baltimore Bomb', description: 'Delicious pie.', price_slice: 6.50, price_pie: 30.00)
  end

  it 'is valid' do
    expect(item).to be_valid
  end

  it 'is invalid without a title' do
    item.title = nil
    expect(item).not_to be_valid
  end

  it 'is invalid without a description' do
    item.description = nil
    expect(item).not_to be_valid
  end

  it 'is invalid without a slice price' do
    item.price_slice = nil
    expect(item).not_to be_valid
  end

  it 'is invalid without a pie price' do
    item.price_pie = nil
    expect(item).not_to be_valid
  end


end
