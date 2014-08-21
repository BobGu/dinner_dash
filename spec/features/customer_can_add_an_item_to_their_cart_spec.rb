require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
  let(:item_name) { 'Key Lime' }
  let!(:keylime)  { Item.create! title: item_name, description: "yum", price_slice: 5, price_pie: 34 }
  let!(:apple)    { Item.create! title: 'Apple', description: "delicious", price_slice: 4, price_pie: 29 }
  let!(:category) { Category.create! name: "cool kids"}



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

    it 'has the correct count for each item' do
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      page.visit item_path(apple)
      page.click_on('Add To Cart')
      page.visit item_path(apple)
      page.click_on('Add To Cart')
      # go to the cart page
      page.visit cart_path
      # expect pages css or first pie title to have the text 1
      expect(page.find(:css, '.pie_quantity:nth-of-type(1)').text).to have_content(1)
      # Expect pages css the second pie title to have the text 2
      expect(page.find(:css, '.pie_quantity:nth-of-type(2)').text).to have_content(2)
    end

    it 'can find the total price of an order' do
      #assuming items are added to cart
      page.visit item_path(keylime)
      page.click_on('Add To Cart')
      page.visit item_path(apple)
      page.click_on('Add To Cart')
      #at cart page
      visit cart_path
      #see a correct price for each item
      expect(page).to have_content(63)
    end

    # i need to create the authroization and aunthentication that has a user controller
    # and an admin controller, orrrr a default user controller and an admin controller

    it 'creates an order once the cart is checked out' do
      # user visit an item page
      page.visit item_path(keylime)
      # they click add to cart
      page.click_on('Add To Cart')
      # They visit their cart
      page.visit cart_path
      # they click the checkout button
      page.click_on('Checkout')
      # they can go to their orders page and see and order with one pie
      page.visit orders_path
      expect(page).to have_content(1)
    end
  end
end
