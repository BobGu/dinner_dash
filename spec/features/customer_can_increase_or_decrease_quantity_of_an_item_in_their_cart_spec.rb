require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


describe 'a user viewing the cart page', type: :feature do

  let(:keylime) { Item.create!(title: 'Key Lime', description: 'Yummy',  price_pie: 30.00) }

  it 'can increase the quantity of an item by one' do
    keylime
    page.visit items_path
    click_on 'ADD TO CART'
    visit cart_path
    click_on '+'
    visit cart_path
    expect(page).to have_content(2)
  end
end
