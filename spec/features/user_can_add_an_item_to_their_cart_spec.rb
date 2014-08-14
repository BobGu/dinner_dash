require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
  let(:item_name) { 'Key Lime' }
  let!(:keylime)  { Item.create! title: item_name, description: "yum", price_slice: 5, price_pie: 34 }


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
      #I look at the keylime item
      page.visit item_path(keylime)
      #And I add it to my cart
      page.click_on('Add To Cart')
      # maybe we'll change this route later
      page.visit item_path(keylime)
      #I add it again
      page.click_on('Add To Cart')
      #visit the cart page
      visit cart_path
      #we expect to see the words 'Key Lime' once
      expect(page).to have_content(item_name)
      #we expect to see the total price of both pies
      expect(page).to have_content(68)
      #we expect to see the count of pies
      expect(page).to have_content(2)
    end
  end
end
