require 'rails_helper'

RSpec.describe Categorization, :type => :model do
	let(:item) 						{ Item.create(title: 'Key Lime', description: 'yum', price_slice: 4.00, price_pie: 25.00)}
	let(:category) 				{ Category.create(name: 'Sweet')}  
  let(:categorization) 	{ Categorization.create(item_id: item.id, category_id: category.id)}

  it 'is valid' do
    expect(categorization).to be_valid
  end  

  it 'is not valid without an item id' do
  	categorization.item_id = nil
  	expect(categorization).not_to be_valid
  end

  it 'is not valid without a category id' do
  	categorization.category_id = nil
  	expect(categorization).not_to be_valid
  end

end
