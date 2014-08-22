require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the header view', type: :feature do
  it 'expects the cart number to be zero' do
    page.visit items_path
    expect(page).to have_content(0)
  end

  it 'expects the cart number to be one when a item is added' do
    item = Item.create(title: 'Key Lime', description: 'Yum',  price_pie: 50)
    page.visit item_path(item)
    page.click_on('ADD TO CART')
    page.visit items_path
    expect(page).to have_content(1)
  end
end
