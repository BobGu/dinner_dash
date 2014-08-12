require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) do
  	Category.new(name: "Savory")
  end

  it 'is valid' do 
  	expect(category).to be_valid
  end

  it 'is invalid without a name' do 
  	category.name = nil

  	expect(category).not_to be_valid
  end 
end
