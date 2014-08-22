require 'rails_helper'

RSpec.describe Categorization, :type => :model do
	let(:item) 						{ Item.create(title: 'Key Lime', description: 'yum',  price_pie: 25.00)}
	let(:category) 				{ Category.create(name: 'Sweet')}
  let(:categorization) 	{ Categorization.create(item_id: item.id, category_id: category.id)}

  it 'is valid' do
    expect(categorization).to be_valid
  end

end
