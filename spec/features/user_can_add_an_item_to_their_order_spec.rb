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
      visit order_path(order)
      expect(page).to have_content(1)
      expect(page).to have_content(item_name)
      expect(page).to have_content(keylime.price_pie)
    end

    xit 'adds two of the same item' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      visit order_path
      expect(page).to have_content(item_name)
      expect(page).to have_content(68)
      expect(page).to have_content(2)
    end

    xit 'has two of the same item and item name only appears once' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit order_path
      expect(page).to_not have_css('.pie_title:nth-of-type(2)')
    end

    xit 'displays correct price for many items' do
      #assuming items are added to cart
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(apple)
      page.click_on('ADD TO CART')
      #at cart page
      visit cart_path
      #see a correct price for each item
      expect(page).to have_content(item_name)
      expect(page).to have_content(34)
      expect(page).to have_content("Apple")
      expect(page).to have_content(29)
    end

    xit 'can delete items from their cart' do
      #visit items page
      page.visit item_path(keylime)
      #add keylime to cart
      page.click_on('ADD TO CART')
      #then go to cart page
      page.visit cart_path
      #delete keylime
      page.click_on('Delete from Cart')
      #there are no more keylimes in cart
      expect(page).not_to have_content(item_name)
    end
  end
end
