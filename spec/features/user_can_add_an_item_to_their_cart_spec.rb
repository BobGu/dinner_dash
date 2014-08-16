require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
  let(:item_name) { 'Key Lime' }
  let!(:keylime)  { Item.create! title: item_name, description: "yum", price_slice: 5, price_pie: 34 }
  let!(:apple)    { Item.create! title: 'Apple', description: "delicious", price_slice: 4, price_pie: 29 }


  context 'Unauthenticated Customer' do
    it 'adds item' do
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      visit cart_path
      expect(page).to have_content(1)
      expect(page).to have_content(item_name)
      expect(page).to have_content(keylime.price_pie)
    end

    it 'adds two of the same item' do
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      visit cart_path
      expect(page).to have_content(item_name)
      expect(page).to have_content(68)
      expect(page).to have_content(2)
    end

    it 'has two of the same item and item name only appears once' do
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      page.visit cart_path
      expect(page).to_not have_css('.pie_title:nth-of-type(2)')
    end

    it 'displays correct price for many items' do
      #assuming items are added to cart
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      page.visit item_path(apple)
      page.click_on('Add To Cart')
      #at cart page
      visit cart_path
      #see a correct price for each item
      expect(page).to have_content(item_name)
      expect(page).to have_content(34)
      expect(page).to have_content("Apple")
      expect(page).to have_content(29)
    end

    it 'cart is empty with new session' do
      skip
      # visit the key lime page
      page.visit item_path(keylime)
      # add a key lime pie
      page.click_on('Add To Cart')
      # quit the session
      #visit the cart
      page.visit cart_path
      # expect the cart to have nothing or be empty
      expect(page).not_to have_content(item_name)
    end

    it 'can delete items from their cart' do
      #visit items page
      page.visit item_path(keylime)
      #add keylime to cart
      page.click_on('Add To Cart')
      #then go to cart page
      page.visit cart_path
      #delete keylime
      page.click_on('Delete from Cart')
      #there are no more keylimes in cart
      expect(page).not_to have_content(item_name)
    end

    it "can click on a category and expect to see it's items." do
      binding.pry
      #visit items page
      #see categories
      #select a category
      #see it's items

    end



  end
end
