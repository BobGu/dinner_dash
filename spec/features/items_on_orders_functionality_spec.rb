require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "user functionality related to items on order view", type: :feature do
  let(:keylime) { Item.create!(title: 'Key Lime', description: 'Yummy',  price_pie: 30.00) }

  let(:order) {Order.create!(user_id: 2, order_total: 23, order_type: "pick-up", order_status: "paid" )}

  it "sees items with item name, quantity, price, and line-item subtotal" do
    #on orders index page
    page.visit orders_path
    #click on any order_id
    click_on(order.order_id)
    #item has a name, quantity, price, and line-item subtotal

    #expect to see item attributes for an item in an order
  end
end
