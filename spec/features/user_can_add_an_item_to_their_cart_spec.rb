require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user viewing the items page', type: :feature do
  let(:item_name) { 'Key Lime' }
  let!(:keylime)  { Item.create! title: item_name, description: "yum", price_slice: 5, price_pie: 34 }


  context 'Unauthenticated Customer' do
    it 'adds item' do
      # I look at the "Keylime" item
      page.visit item_path(keylime)

      # And I it it to my cart
      page.click_on('Add To Cart')

      # maybe assert that you're still on key-lime page

      # And I visit my cart page
      visit cart_path

      # Then I see I'm ordering 1 "Keylime"
      # FIXME! Not asserting that we only have 1

      expect(page).to have_content(item_name) # ideally would scope this to relevant dom objects

      # And I see my total is the cost of 1 "Keylime"
      require "pry"
      binding.pry
    end
  end
end
