require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
  let(:item_name) { 'Key Lime' }
  let!(:keylime)  { Item.create! title: item_name, description: "yum",  price_pie: 34 }
  let!(:apple)    { Item.create! title: 'Apple', description: "delicious", price_pie: 29 }
  let!(:category) { Category.create! name: "cool kids"}


  context 'Unauthenticated Customer' do
    it 'adds item' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      visit cart_path
      expect(page).to have_content(1)
      expect(page).to have_content(item_name)
      expect(page).to have_content(keylime.price_pie)
    end
  end
end
