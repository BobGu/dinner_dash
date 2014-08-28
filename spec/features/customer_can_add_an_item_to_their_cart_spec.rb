require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
  let(:item_name) { 'Key Lime' }
  let!(:keylime)  { Item.create! title: item_name, description: "yum", price_pie: 34 }
  let!(:apple)    { Item.create! title: 'Apple', description: "delicious",  price_pie: 29 }
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

    it 'adds two of the same item' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      visit cart_path
      expect(page).to have_content(item_name)
      expect(page).to have_content(68)
      expect(page).to have_content(2)
    end

    it 'has two of the same item and item name only appears once' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit cart_path
      expect(page).to_not have_css('.pie_title:nth-of-type(2)')
    end

    it 'displays correct price for many items' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(apple)
      page.click_on('ADD TO CART')
      visit cart_path
      expect(page).to have_content(item_name)
      expect(page).to have_content(34)
      expect(page).to have_content("Apple")
      expect(page).to have_content(29)
    end

    it 'has the correct count for each item' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(apple)
      page.click_on('ADD TO CART')
      page.visit item_path(apple)
      page.click_on('ADD TO CART')
      page.visit cart_path
    end

    it 'can find the total price of an order' do
      page.visit item_path(keylime)
      page.click_on('ADD TO CART')
      page.visit item_path(apple)
      page.click_on('ADD TO CART')
      visit cart_path
      expect(page).to have_content(63)
    end

    # i need to create the authroization and aunthentication that has a user controller
    # and an admin controller, orrrr a default user controller and an admin controller
  end
end
